const express = require('express');
const client = require('prom-client');

// Create a new registry
const register = new client.Registry();

// Collect default metrics like CPU and memory usage
client.collectDefaultMetrics({ register });

// Custom metric: Counter example
const httpRequestCounter = new client.Counter({
  name: 'http_requests_total',
  help: 'Total number of HTTP requests',
  labelNames: ['method', 'route'],
});

// Custom metric: Gauge example
const httpResponseTime = new client.Gauge({
  name: 'http_response_time_seconds',
  help: 'Response time in seconds',
  labelNames: ['method', 'route'],
});

// Register custom metrics to the registry
register.registerMetric(httpRequestCounter);
register.registerMetric(httpResponseTime);

const app = express();

// Simulate a route that would be part of your React app
app.get('/', (req, res) => {
  const start = Date.now();

  // Increment the HTTP request counter for this route
  httpRequestCounter.labels(req.method, '/').inc();

  res.send('Hello from React with Prometheus metrics!');

  // Record the response time
  const duration = (Date.now() - start) / 1000;
  httpResponseTime.labels(req.method, '/').set(duration);
});

// Expose /metrics endpoint for Prometheus to scrape
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType);
  res.end(await register.metrics());
});

// Start the Express server
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Metrics server running on port ${PORT}`);
});
