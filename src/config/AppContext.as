package config 
{
    import Classes.ConfigurableArrayCollection;
    import Classes.Stock;
    
    import flash.utils.setTimeout;
    
    import mx.collections.ArrayCollection;
    import mx.events.CollectionEvent;
    
    import views.StockList;

	public class AppContext
	{
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
		public function AppContext()
		{
			trace("configgd")
            stockCollection = new ConfigurableArrayCollection([
                new Stock('DOW J', 12153.68, 12153.68 + 259.89),
                new Stock('NASDAQ', 2678.75, 2678.75 + 53.6),
                new Stock('S&P 500', 1263.85, 1263.85 + 24.16),
                new Stock('AAPL', 384.62, 384.62 - 0.60),
                new Stock('GOOG', 608.35, 608.35 + 13.27),
                new Stock('YHOO', 16.27, 16.27 + 0.32),
            ])
                
            sl = new StockList;
            
            goNuts();
		}
        
        private function goNuts():void {
            for( var i:int = 0; i<100; i++){
                stockCollection.addItem(new Stock((Math.random()*100000).toString(32).toUpperCase(), Math.random()*10, Math.random() * 100 - 40));
            }
            setTimeout(randomize, 50)
        }
        
        private function randomize():void
        {
            stockCollection.turnOff();
            
            for( var i:int = 0; i < 1000; i++){
                //var stock:Stock = stockCollection.getItemAt() as Stock;
                var stock:Stock = stockCollection.source[int(Math.random()*stockCollection.length)] as Stock;
                var change:Number = (Math.random() - 0.5) * stock.yesterday;
                stock.value += change;
                dispatcher(new StockMessage(stock.name, stock.value, stock.yesterday));
            }
            setTimeout(randomize, 50)
            
            stockCollection.turnOn();
            //stockCollection.dispatchEvent(new CollectionEvent(CollectionEvent.COLLECTION_CHANGE));
        }
        
        public var sl:StockList;
        private var stockCollection:ConfigurableArrayCollection;
	}
}