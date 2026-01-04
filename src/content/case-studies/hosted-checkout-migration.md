---
title: "Migrating to a PCI-Compliant Hosted Checkout Platform"
description: "How I approached reliability, security, and operational trade-offs when modernising a payment flow using hosted checkout, tokenisation, and 3-D Secure."
pubDate: "2025-01-15"
heroImage: "/post_img.webp"
tags:
  - Fintech
  - Payments
  - PCI
  - Hosted Checkout
  - Tokenisation
  - 3DS
  - Integrations
  - Azure
---

## Context

A fintech platform was processing customer payments using a legacy, tightly coupled integration.
The system had grown over time and was handling real customer traffic, but its design made
**security, compliance, and operational reliability increasingly difficult to manage**.

The business goal was clear:  
**improve security and resilience without disrupting live payment flows or customer experience**.

---

## The Problem

Several issues had accumulated over time:

- Card data handling increased **PCI scope and operational risk**
- Payment flows were mostly **synchronous**, making failures hard to isolate
- Callback and status handling logic was inconsistent across integrations
- Debugging production issues required manual log correlation and guesswork

While the system “worked”, it was fragile under load and costly to operate safely.

---

## Constraints & Real-World Considerations

This was not a greenfield rewrite.

Key constraints included:

- **No downtime** during migration
- Existing contracts with payment providers
- Multiple upstream and downstream integrations
- Strict compliance and audit requirements
- Limited tolerance for behavioural changes in the customer journey

Any solution had to be **incremental, observable, and reversible**.

---

## Design Decisions

### 1. Move to Hosted Checkout + Tokenisation

Rather than continuing to handle sensitive card data directly, the system was redesigned around a
**hosted checkout model**:

- Card details handled by the payment provider
- Platform stores **tokens only**, not raw card data
- Reduced PCI scope and simplified compliance

This immediately shifted risk away from the core platform.

---

### 2. Introduce Clear Payment State Transitions

Payment processing was modelled explicitly as a **state machine**:

- Initiated
- Awaiting authentication (3-D Secure)
- Authorised / Failed
- Finalised

This made flows easier to reason about and significantly improved supportability and auditability.

---

### 3. Decouple Callbacks with Asynchronous Processing

Provider callbacks and webhooks were handled asynchronously:

- Incoming events validated and queued
- Idempotent processing to handle retries and duplicates
- Clear correlation IDs for tracing across services

This avoided cascading failures and made the system far more resilient under burst traffic.

---

### 4. Build for Observability from Day One

Observability was treated as a feature, not an afterthought:

- Structured logs with correlation IDs
- Metrics for payment outcomes and retry behaviour
- Alerting based on business-meaningful signals, not just errors

This drastically reduced mean time to diagnose issues in production.

---

## Outcome

The migration delivered tangible improvements:

- **Reduced PCI exposure** and compliance overhead
- Improved reliability under load and partial failures
- Faster and more confident incident response
- Clearer audit trails for payments and callbacks
- A foundation that supports future payment providers and flows

Most importantly, the migration was achieved **incrementally**, without business disruption.

---

## Trade-offs & Lessons Learned

No solution is free of trade-offs:

- Hosted checkout reduces flexibility in UI customisation
- Asynchronous flows add complexity in reasoning about state
- Strong observability requires discipline and ongoing investment

However, for payment systems, these trade-offs were worth it.
**Operational clarity and safety outweighed raw control**.

---

## Key Takeaways

- In fintech, **security and reliability are architectural concerns**, not add-ons
- Idempotency and clear state models simplify both code and operations
- Observability should answer “what happened?” before incidents occur
- Incremental modernisation is often safer than large rewrites

---

*This case study is intentionally anonymised and focuses on architectural decisions rather than business-specific details.*
