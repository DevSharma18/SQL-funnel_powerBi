# Project Description Report

## Client Site Funnel and Revenue Analysis

**Project type:** Data analytics / business intelligence portfolio project  
**Tools present:** SQLite, SQL, Power BI Desktop, CSV, Markdown  
**Source brief:** [`docs/Week 4 Task.pdf`](docs/Week%204%20Task.pdf)  
**Review basis:** Repository files, CSV and SQLite data, SQL scripts, task brief, and dashboard screenshots

## Executive summary

This project analyzes client-site event data to describe user activity across a purchase journey and summarize revenue by business dimensions. The repository includes a source CSV, a SQLite database containing the imported data, SQL query examples, a Power BI report, screenshots, and project documentation.

The supplied dataset contains **21,409 event records** for **10,000 users** and **10,000 sessions**. It records four event types—Browse, Add to Cart, Checkout, and Purchase—and total revenue is **277,323.06**. All recorded revenue is associated with Purchase events.

This is an analytics project, not a web application: there is no application source code, server, or deployment configuration. The report can be shared as static project documentation, while an interactive dashboard must be published through Power BI or opened in Power BI Desktop.

## Business goal and scope

The internship brief asks the analyst to:

- Explore record, user, session, and event counts.
- Analyze event-stage reach and user drop-off.
- Summarize revenue by region, channel, and device.
- Identify high-value users and business segments.
- Present KPIs and visuals in a Power BI dashboard.
- Convert analysis into business insights and recommendations.

The dataset’s actual events are **Browse → Add to Cart → Checkout → Purchase**. This differs from the five-stage labels in the task brief (Visit, Session Start, Product View, Click, Purchase); the available data does not contain those five exact event labels.

## Repository contents

| Path | Purpose |
|---|---|
| [`dataset/client_site_dataset.csv`](dataset/client_site_dataset.csv) | Primary source dataset |
| [`database/funnel_analysis.db`](database/funnel_analysis.db) | SQLite database with the imported event table |
| [`database/funnel_analysis.sqbpro`](database/funnel_analysis.sqbpro) | DB Browser for SQLite project settings and saved query |
| [`sql/funnel_analysis_queries.sql`](sql/funnel_analysis_queries.sql) | SQL examples for data preview, revenue, category, and region summaries |
| [`sql/SQL-Command.md`](sql/SQL-Command.md) | Additional SQL command notes |
| [`powerbi/Client_Site_Analytics_Dashboard.pbix`](powerbi/Client_Site_Analytics_Dashboard.pbix) | Power BI Desktop report |
| [`powerbi/`](powerbi/) | Dashboard screenshots and CSV-import screenshot |
| [`screenshots/`](screenshots/) | SQL query output and dashboard screenshots |
| [`docs/Week 4 Task.pdf`](docs/Week%204%20Task.pdf) | Original internship project brief |
| [`docs/client_site_dataset (1).csv`](docs/client_site_dataset%20%281%29.csv) | Duplicate copy of the primary CSV; the two files are byte-identical |
| [`README.md`](README.md) | Existing repository overview and usage notes |
| [`LICENSE`](LICENSE) | Project and dataset ownership/rights notice |

## Data profile

The CSV and SQLite table both contain 21,409 records and the same ten fields:

| Field | Description |
|---|---|
| `User ID` | User identifier |
| `Session ID` | Session identifier |
| `Event Time` | Event-time value as stored in the source |
| `Event` | Event/funnel stage |
| `Device` | Desktop, Tablet, or Mobile |
| `Region` | North, South, East, or West |
| `Channel` | Google Ads, Email, Organic, or Social Media |
| `Product Category` | Electronics, Beauty, Fashion, Home, or Sports |
| `Revenue` | Revenue value |
| `Bonus Flag` | Yes/No flag |

The SQLite database contains one table named `funnel_data`. The database and CSV have matching row counts and columns. No null values were found in the ten fields. There are 10,000 distinct users and 10,000 distinct sessions.

### Verified summary metrics

| Metric | Verified value |
|---|---:|
| Event records | 21,409 |
| Distinct users | 10,000 |
| Distinct sessions | 10,000 |
| Purchase events | 1,004 |
| Total revenue | 277,323.06 |
| Average revenue per event across all rows | 12.95 |
| Average revenue per Purchase row | 276.22 |
| Revenue on non-Purchase events | 0 |

### Event-stage counts

| Event | Records / distinct users | Reach relative to Browse |
|---|---:|---:|
| Browse | 10,000 | 100.00% |
| Add to Cart | 6,949 | 69.49% |
| Checkout | 3,456 | 34.56% |
| Purchase | 1,004 | 10.04% |

Using the stage counts as a simple reach comparison, the largest adjacent drop is from **Checkout to Purchase**: 2,452 fewer records, or approximately **70.95%** of Checkout-stage records. This is a descriptive comparison of stage counts. The current SQL does not establish that each stage occurred in order within the same session, so it should not be presented as a validated session-level conversion funnel until that is checked.

### Revenue by channel and region

| Channel | Revenue |
|---|---:|
| Google Ads | 73,862.32 |
| Email | 69,126.46 |
| Social Media | 68,361.24 |
| Organic | 65,973.04 |

| Region | Revenue |
|---|---:|
| South | 77,421.45 |
| North | 68,645.13 |
| East | 66,116.01 |
| West | 65,140.47 |

Electronics is the highest-revenue product category among Purchase rows, with **62,938.46**. These values were calculated from the supplied SQLite database.

## Analysis assets and current implementation

The SQL script currently includes queries for viewing rows, total revenue, average revenue per event, revenue grouped by product category, purchase revenue grouped by product category, and revenue by region. It does **not** currently implement all analyses described in the README or task brief: event-stage conversion/drop-off, revenue by channel/device, top users, or device conversion.

The existing dashboard screenshots show revenue cards and category, channel, and region charts, plus device/event/user selection visuals. The screenshots do not demonstrate the complete set of visuals specified in the task brief (funnel chart, device-distribution pie chart, and revenue-over-time line chart). The KPI labels and visible controls in the screenshots also do not consistently show the brief’s requested KPI cards. Review the PBIX in Power BI Desktop before describing those elements as implemented.

There is a related issue in [`sql/SQL-Command.md`](sql/SQL-Command.md): one query references a `Product` column, but the supplied table has `Product Category` and no `Product` field. That query will not run against the included database without correction.

## Findings and recommended next steps

1. **Complete and verify the SQL analysis.** Add the missing brief requirements using the actual schema, then run each query against `database/funnel_analysis.db`. In particular, calculate stage reach, revenue by device/channel, and top users.
2. **Validate funnel semantics.** Confirm the intended event ordering and whether records can be tied together reliably by session before treating stage ratios as user conversion rates.
3. **Align the dashboard and its description.** Verify the PBIX visuals and KPI measures against the task brief, then update README claims and screenshots to reflect the actual report.
4. **Clarify revenue measures.** Label 12.95 as average revenue per event and 276.22 as average revenue per purchase row; they use different denominators.
5. **Check data-sharing rights before public hosting.** The repository license says the dataset and related materials belong to the organization that provided them. Confirm redistribution permission before publishing the CSV, database, or an unrestricted dashboard.

## Hosting guide

### Option A — Host the project documentation on GitHub Pages

This is suitable for a static portfolio page and report. It does not execute SQL or render the PBIX interactively.

1. Push the repository to GitHub, after confirming the dataset and screenshots may be shared publicly.
2. Add a website entry page such as `index.md` at the repository root. Link from it to this report, the README, dashboard screenshots, and (if permitted) the PBIX.
3. Open the GitHub repository and select **Settings → Pages**.
4. Under the build/deployment settings, choose **Deploy from a branch**, select the branch containing the files (commonly `main`) and the repository root (`/`), then save.
5. Wait for the Pages deployment to finish. GitHub will display the published URL in the Pages settings.
6. Open that URL and verify the report links and image paths. Use repository-relative links and paths so they work on the published site.

If GitHub Pages does not use the report file as the site homepage, the `index.md` page should act as a landing page and link to [`PROJECT_DESCRIPTION_REPORT.md`](PROJECT_DESCRIPTION_REPORT.md).

### Option B — Host the interactive dashboard with Power BI

Use this when viewers need to interact with the report rather than view screenshots.

1. Open [`powerbi/Client_Site_Analytics_Dashboard.pbix`](powerbi/Client_Site_Analytics_Dashboard.pbix) in Power BI Desktop.
2. Verify that visuals and measures are correct and that the report opens without missing-source or refresh errors.
3. Sign in to Power BI, choose **Publish**, and select an appropriate workspace.
4. In Power BI Service, grant access to the intended viewers or share the report using the organization’s approved method. Viewer access and sharing may require a suitable Power BI license or capacity.
5. If embedding in another site, use an authenticated/permission-controlled embed method appropriate to your organization.

**Do not use Power BI “Publish to web” for this report unless the data owner has explicitly approved public disclosure.** That option makes the report and its data accessible on the public internet; it is not private sharing.

### Option C — Share the PBIX for download

The PBIX can be linked from the GitHub repository or attached to a release, subject to the same data-rights approval. Viewers need Power BI Desktop or suitable Power BI Service access to open and interact with it. A PBIX file by itself is not a hosted interactive webpage.

## Conclusion

The repository is a compact SQL and Power BI analytics portfolio project with a reproducible dataset/database pair and useful early revenue summaries. The data confirms a substantial drop between Checkout and Purchase by stage counts, and Google Ads and the South region lead revenue in the supplied records. Before presenting it as a complete funnel dashboard or publishing its data publicly, complete the missing analyses, reconcile the dashboard with the brief, and confirm the dataset’s redistribution terms.
