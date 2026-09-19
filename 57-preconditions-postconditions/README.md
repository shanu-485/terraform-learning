# Day 57: Terraform Preconditions and Postconditions

## Overview

This exercise demonstrates Terraform lifecycle conditions using:

- `precondition`
- `postcondition`
- `terraform_data`

The goal is to understand how Terraform can validate resource configuration before and after a resource operation.

## Concepts Covered

### Precondition

A `precondition` validates a condition before Terraform performs the resource operation.

In this example, the application name must contain at least 5 characters.

### Postcondition

A `postcondition` validates the result after Terraform has processed the resource.

In this example, the resource output must equal `Application`.

## Files

```text
57-preconditions-postconditions/
├── main.tf
└── README.md

