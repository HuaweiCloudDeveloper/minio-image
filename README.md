<p align="center">
  <h1 align="center">MinIO distributed object storage system</h1>
  <p align="center">
    <a href="README.md"><strong>English</strong></a> | <strong>简体中文</strong>
  </p>
</p>

## Table of Contents

- [Repository Introduction](#repository-introduction)
- [Prerequisites](#prerequisites)
- [Image Specifications](#image-specifications)
- [Getting Help](#getting-help)
- [How to Contribute](#how-to-contribute)

## Repository Introduction
‌[MinIO‌](https://github.com/minio/minio) MinIO is a high-performance, open-source, cloud-native distributed object storage system compatible with Amazon S3 APIs for large-scale data storage, backup, analysis, and AI/ML workloads. Written in Golang, it is lightweight and easy to deploy for private, public, and edge computing environments.

**Core Features:**
1. High-performance object storage: Uses a software-defined distributed architecture, supports Amazon S3 compatible APIs, and provides the same functional interfaces as AWS S3 (Put, GET, and DELETE). The parallel design and memory optimization achieve high throughput (up to several GB/s per node) and low latency (response in milliseconds), which is suitable for scenarios such as big data and AI/ML.
2. Distributed architecture: Supports multi-node cluster deployment. By default, the erasure code technology is used to store data fragments on different nodes and tolerate multi-disk/node faults. (For example, two of the four nodes are allowed to break down.) Dynamic scalability, linear capacity and performance increase by simply adding nodes, and PB-level data storage.
3. Enterprise-level data protection: Built-in encryption functions (SSL/TLS transmission encryption and AES-256 server-side encryption) and KMS integrated management keys. Object Lock and Versioning prevent data from being tampered with or deleted by mistake and meet compliance requirements (e.g., SEC 17a-4, HIPAA).
4. Multi-cloud and hybrid cloud support: It can be deployed on physical machines, VMs, Kubernetes (Operator or Helm Chart), and edge devices to seamlessly run on public, private, or hybrid clouds. The storage gateway mode is supported. Local storage is used as the cache layer of cloud storage (such as AWS S3).
5. Lightweight and easy to manage: Single binary file deployment, no external dependency, and extremely low resource usage (only 512 MB memory is required for startup). Provides the web console, command line tool (MC), and Prometheus/Grafana monitoring integration, and supports log audit and performance indicator visualization.
6. Strong consistency model: All read and write operations strictly comply with strong consistency, ensuring that data is immediately visible and globally consistent, avoiding potential problems of final consistency.
7. Various APIs and ecosystem integration: Compatible with S3 APIs, SDKs of all mainstream development languages (such as Python, Java, and Go), and seamless interconnection with big data tools such as Hadoop, Spark, and Kafka. Provides the MinIO Select function to directly query object content (for example, SQL filtering of CSV/JSON files).
8. Open source and commercial dual license: The open source version (GNU AGPL v3) includes all core functions, and the enterprise version extends advanced features (such as global caching and multi-site synchronization).

This project offers pre-configured [**`MinIO-Distributed object storage system`**](https://marketplace.huaweicloud.com/intl/hidden/contents/ff3a26bb-ee3f-42e0-97ff-52fe163a35d6)，images with MinIO and its runtime environment pre-installed, along with deployment templates. Follow the guide to enjoy an "out-of-the-box" experience.

**Architecture Design:**

![](./images/img.png)

> **System Requirements:**
> - CPU: 4vCPUs or higher
> - RAM: 16GB or more
> - Disk: At least 50GB

## Prerequisites
[Register a Huawei account and activate Huawei Cloud](https://support.huaweicloud.com/usermanual-account/account_id_001.html)

## Image Specifications

| Image Version          | Description | Notes |
|------------------------| --- | --- |
| [MinIO20250422221226.0.0-1-arm-v1.0]() | Deployed on Kunpeng servers with Huawei Cloud EulerOS 2.0 64bit |  |

## Getting Help
- Submit an [issue](https://github.com/HuaweiCloudDeveloper/minio-image/issues)
- Contact Huawei Cloud Marketplace product support

## How to Contribute
- Fork this repository and submit a merge request.
- Update README.md synchronously based on your open-source mirror information.