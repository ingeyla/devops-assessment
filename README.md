# DevOps Technical Test: Deploying a Django App on AWS ECS

Welcome to the DevOps technical test! Your goal is to **deploy a simple Django application** on AWS using **ECS**.

## Overview

1. **Dockerize** a Django application (included in this repository).
2. **Push** the Docker image to AWS ECR (Elastic Container Registry).
3. **Set up** an ECS cluster, a task definition, and a service.
4. **Run** the Django application in ECS.
5. **Expose** the service publicly (so we can access it via a URL).

> **Note**: You may use any combination of AWS Free Tier resources and AWS services (e.g., Fargate, EC2-backed ECS, etc.) as long as the application is successfully deployed on ECS.

## Requirements

1. **AWS Account**

   - Use your own AWS account.
   - Stay within the AWS Free Tier.
   - Keep security best practices in mind (avoid committing credentials).

2. **Docker & Dockerfile**

   - Create a basic Dockerfile.
   - Modify it as needed so the Django app runs correctly.

3. **AWS Services**

   - **ECR**: To host the Docker image.
   - **ECS**: To run the container (Fargate or EC2).
   - **IAM**: Set up proper roles/permissions.
   - **VPC / Security Groups**: Basic network configuration.
   - **Elastic Load Balancer** (if necessary) to expose your service publicly.
   - **RDS**: To add storage to Django application.

4. **Application**

   - The Django application should be publicly accessible.
   - Add a simple `/health` endpoint that returns **"OK"**.

5. **Deliverables**

   - **Deployed Service**: A running service accessible via public URL or IP.
   - **Documentation**: Update this `README.md` or provide a separate document describing:
     - How to build and run the container locally.
     - How to deploy to AWS ECS.
     - Any AWS resources used.

6. **Time Constraint**
   - You have **24 hours** from the moment you fork this repository to complete the test and send the URL of the deployed solution to antonio@kodealabs.com.

## Instructions

1. **Fork this Repository**

   - Click the "Fork" button in GitHub.

2. **Set Up the Django App**

   - Review or create the Django project in this repo.
   - Run it locally:
     ```bash
     python manage.py runserver
     ```
   - Add/confirm a `/health` endpoint that returns "OK".

3. **Dockerize the App**

   - Review or create a `Dockerfile`.
   - Example to build and run locally:
     ```bash
     docker build -t my-django-app .
     docker run -p 8000:8000 my-django-app
     ```
   - Ensure the container serves the Django app on port 8000.
   - Tip: Read about entrypoint commands for Django on production, Django migrations and installing pip requirements.

4. **Push the Image to ECR**

   1. Create a repository in ECR (e.g., `my-django-app`).
   2. Authenticate Docker to ECR.
   3. Build/tag your Docker image to match the ECR repository URI.
   4. Push the image to ECR.

5. **Deploy on ECS**

   1. Create an ECS cluster (Fargate or EC2).
   2. Create a task definition referencing your ECR image.
   3. Configure CPU, memory, port mappings, environment variables (if needed).
   4. Create a service with your task definition.
   5. Optionally use a load balancer or assign a public IP/security groups to allow inbound HTTP traffic.

6. **Validate the Deployment**

   - Confirm you can access the service from a public endpoint.
   - Check the `/health` endpoint for an "OK" response.

7. **Documentation**

   - Update this `README.md` or include a separate doc describing steps to build, run, and deploy the app.
   - Include any instructions needed to reproduce or troubleshoot the setup.

8. **Submit Your Work**
   - Push all commits to your **forked repo**.
   - Document any outstanding issues.
   - Send URL of the Django Admin page (/admin) to antonio@kodealabs.com.

## Questions

Please provide short answers or a brief plan (in this `README.md` or a separate file) for the following:

1. **Next Steps for a Fully Functional CI/CD Pipeline**

   - What would be your approach to automate the build, test, and deploy processes?
   - Which tools (e.g., GitHub Actions, Jenkins, GitLab CI/CD) would you use and why?

2. **Infrastructure as Code**

   - How would you recreate this entire setup using tools like Terraform, AWS CloudFormation, or AWS CDK?
   - What would be your general strategy to manage and version-control infrastructure configurations?

3. **Possible Uses of Additional AWS and Caching Services**
   - For a **Django RESTful API**, what could be the use case for services like **SQS**, **S3**, **CloudFront**, **Amazon Bedrock** or **Redis**?

Your insights here will help us understand your thought process for automating, scaling, and extending DevOps and backend workflows.

## Evaluation Criteria

1. **Completeness**: Did you follow instructions and produce a running service on ECS?
2. **Code Quality & Organization**: Are Dockerfile and configs well-structured?
3. **AWS Configuration**: Correct setup of IAM, ECS, networking?
4. **Documentation**: Are steps to deploy the application clear?
5. **Time Management**: Did you finish within the 24-hour window? If not, the work done in the timeframe will be evaluated. It is not necessary to finish the entire infrastructure.

---

**Good luck, and happy coding!**
