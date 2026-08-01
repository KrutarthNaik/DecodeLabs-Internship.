# 📊 E-Commerce Sales Data Analysis

Exploratory Data Analysis (EDA) of an e-commerce sales dataset using Python, Pandas, and Matplotlib/Seaborn. The project covers data cleaning, outlier detection, univariate and bivariate analysis, correlation analysis, and time-based sales trends.

## 📁 Dataset

The dataset contains order-level e-commerce transaction records with the following fields:

| Column | Description |
|---|---|
| `OrderID` | Unique identifier for each order |
| `CustomerID` | Unique identifier for each customer |
| `Date` | Order date |
| `Product` | Product name |
| `Quantity` | Number of units ordered |
| `UnitPrice` | Price per unit |
| `ItemsInCart` | Number of items in the cart |
| `TotalPrice` | Total order value |
| `PaymentMethod` | Payment method used |
| `OrderStatus` | Status of the order |
| `CouponCode` | Coupon applied (if any) |
| `ReferralSource` | Source through which the customer arrived |
| `ShippingAddress` | Shipping address |
| `TrackingNumber` | Shipment tracking number |

> **Note:** Update the file path in the notebook (`pd.read_csv(...)`) to point to your local copy of the dataset, or place the CSV in a `data/` folder and update the path accordingly.

## 🛠️ Tools & Libraries

- Python 3
- Pandas
- NumPy
- Matplotlib
- Seaborn

## 🔍 Workflow

1. **Data Loading** – Import the raw CSV dataset.
2. **Data Cleaning**
   - Handle missing values (drop nulls, impute `CouponCode` with the mode)
   - Remove duplicate rows
   - Convert columns to appropriate data types (`datetime`, `string`, `category`)
   - Standardize text fields (trimming whitespace, title/upper casing)
3. **Outlier Detection** – Identify outliers in `TotalPrice` using the IQR method, with boxplots for numeric columns.
4. **Univariate Analysis** – Summary statistics and histograms for numeric columns; value counts and count plots for categorical columns.
5. **Bivariate Analysis** – Scatter plots (`Quantity` vs `TotalPrice`, `UnitPrice` vs `TotalPrice`) and a correlation heatmap.
6. **Time-Series Analysis** – Extract `Year`, `Month`, `Day`, and `Weekday` from the order date; analyze monthly and yearly sales trends.
7. **Aggregated Insights** – Total sales grouped by `PaymentMethod`, `ReferralSource`, `CouponCode`, `Product`, and `OrderStatus`.

## 📈 Key Visualizations

- Boxplots for outlier detection (`Quantity`, `UnitPrice`, `ItemsInCart`, `TotalPrice`)
- Histograms of numeric distributions
- Count plot of payment methods
- Scatter plots of price relationships
- Correlation heatmap
- Monthly sales trend (line plot)
- Yearly sales trend (bar plot)
- Order status distribution (bar plot)

## 🚀 Getting Started

### Prerequisites
```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Running the Notebook
```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
jupyter notebook project2.ipynb
```

## 📂 Project Structure
```
├── project2.ipynb     # Main analysis notebook
├── data/               # (Add your dataset CSV here)
└── README.md
```

## 📌 Findings

- Sales trends fluctuate across months and years, highlighting seasonal patterns.
- Certain payment methods and referral sources contribute disproportionately to total revenue.
- A small number of high-value orders were flagged as outliers using the IQR method.
- Numeric features (`Quantity`, `UnitPrice`, `TotalPrice`, `ItemsInCart`) show varying degrees of correlation, visualized via a heatmap.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

