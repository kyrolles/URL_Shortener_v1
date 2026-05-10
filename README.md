# Containerized URL Shortener Webservice 🚀

A full-stack URL shortener webservice built with Python (Flask) and SQLite, fully containerized using Docker, and instrumented with Prometheus and Grafana for real-time monitoring and observability.

## 🏗️ Architecture

The application is deployed using `docker compose` and consists of three main components:
1. **URL Shortener API (`url_shortener`)**: A Flask-based web application that exposes endpoints to shorten URLs and redirect users.
2. **Prometheus (`prometheus`)**: A time-series database that continuously scrapes performance metrics from the API.
3. **Grafana (`grafana`)**: A powerful visualization platform configured to display actionable insights based on the Prometheus data.

---

## 🚀 How to Run

Ensure you have Docker and Docker Compose installed, then simply run:

```bash
docker compose up -d
```

This will build the application image and start all three services.

---

## 📚 API Documentation

The webservice exposes two primary endpoints:

### 1. Shorten a URL
- **Endpoint:** `/shorten`
- **Method:** `POST`
- **Content-Type:** `application/json`
- **Body:**
  ```json
  {
    "url": "https://www.example.com"
  }
  ```
- **Response (200 OK):**
  ```json
  {
    "short_url": "http://localhost:5000/7vplvZ"
  }
  ```

### 2. Redirect to Original URL
- **Endpoint:** `/<short_code>`
- **Method:** `GET`
- **Description:** Takes the generated short code and redirects the user to the original long URL via a `302 Found` HTTP status.
- **Error Response (404 Not Found):** If the code does not exist.

---

## 📊 Observability & Monitoring (Week 2 & 3)

The project features a fully configured monitoring stack. The URL Shortener exposes custom metrics at `/metrics` which are scraped by Prometheus every 5 seconds.

### Exposed Metrics (Prometheus)
- `urls_shortened_total`: Counter tracking successful URL shortening operations.
- `redirects_total`: Counter tracking successful redirects.
- `failed_lookups_total`: Counter tracking 404 errors (not found).
- `request_latency_seconds`: Histogram tracking the latency for both `shorten` and `redirect` operations.

### Grafana Dashboard (Week 3 Deliverables)
Grafana has been fully integrated and automated using **Provisioning**. This means no manual setup is required!
- **Data Source Provisioning:** Grafana automatically connects to Prometheus.
- **Dashboard Provisioning:** A custom dashboard titled **"URL Shortener Overview"** is automatically loaded.

**The dashboard includes the following visualizations:**
1. **Total Shortened Links:** A single stat showing the total count of shortened links.
2. **Rate of URL Creations & Redirections:** A time-series graph showing operations over time.
3. **95th Percentile Request Latency:** A real-time graph of the 95th percentile latency (p95) categorized by operation.
4. **Rate of 404 Errors:** A graph tracking bad requests and failed lookups.

---

## 🔐 Accessing the Services

- **URL Shortener API:** `http://localhost:5000`
- **Prometheus UI:** `http://localhost:9090`
- **Grafana UI:** `http://localhost:3000`

### Grafana Credentials:
- **Username:** `admin`
- **Password:** `4kadmin`
