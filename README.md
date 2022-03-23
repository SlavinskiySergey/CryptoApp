# CryptoApp
## _ScalableSolutions task, RxSwift, RxCocoa_

_Test task for the position of senior/lead mobile developer_

Develop mobile application with next requirements:
1. On main screen display a list of cryptocurrencies: symbol, name and price in usd. The list should be loaded in batches (pages): at first 20 currencies, while scrolling - another 20, etc. (endpoints /assets and /assets/{assetKey}/metrics/market-data can be obtained using the API: https://messari.io/api/docs).
2. Clicking on a list item opens the details screen. It displays the symbol, name and price, plus the slogan (tagline), detailed description (project_details) and links (official_links) (endpoints /assets, /assets/{assetKey}/metrics/market-data and /assets/{assetKey}/ profile).
3. On details screen it's necessary to display a graph of currency price changes for the last month (endpoint /assets/{assetKey}/metrics/{metricID}/time-series).
4. Use git version control system for tracking changes in source code files.
5. From third-party libraries your can use only RxSwift, RxCocoa. Implement MVVM architecture.
