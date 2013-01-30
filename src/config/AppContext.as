package config 
{
    import Classes.ConfigurableArrayCollection;
    import Classes.Stock;
    import Classes.StockMessageReciever;
    
    import flash.utils.Dictionary;
    
    import views.StockListGroup;
    import Classes.StockMessageGenerator;

	public class AppContext
	{
        
        public var messageCreator:StockMessageGenerator;
        public var messageReciever:StockMessageReciever;
        public var stockListGroup:StockListGroup;
        public var stockCollection:ConfigurableArrayCollection;
        public var dictionary:Dictionary;
        
		public function AppContext()
		{
                dictionary = new Dictionary(false);
            
                stockCollection = new ConfigurableArrayCollection([
                new Stock('DOW J', 12153.68, 12153.68 * 2.5989),
                new Stock('NASDAQ', 2678.75, 2678.75 * .536),
                new Stock('S&P 500', 1263.85, 1263.85 * .2416),
                new Stock('AAPL', 384.62, 384.62 * -.060),
                new Stock('GOOG', 608.35, 608.35 * .1327),
                new Stock('YHOO', 16.27, 16.27 * -.032),
            ])
            refreshDictionary();        
                           
            stockListGroup = new StockListGroup();
        
            addRandomInstruments();
            
            messageCreator = new StockMessageGenerator();
            messageReciever = new StockMessageReciever();
		}
        
        public function refreshDictionary():void{
            dictionary = new Dictionary();
            for(var i:int=0; i<stockCollection.length; i++){
                var stock:Stock = stockCollection.getItemAt(i) as Stock;
                dictionary[stock.name] = stock;
            }
        }
        
        private function addRandomInstruments():void {
            for( var i:int = 0; i<100; i++){
                stockCollection.addItem(new Stock((Math.random()*100000).toString(32).toUpperCase(), Math.random()*10, Math.random() * 100 - 40));
            }
            
            refreshDictionary();
        }
	}
}