package config 
{
    import Classes.ConfigurableArrayCollection;
    import Classes.Stock;
    import Classes.StockMessageReciever;
    
    import flash.utils.Dictionary;
    import flash.utils.setTimeout;
    
    import mx.collections.ArrayCollection;
    import mx.events.CollectionEvent;
    
    import org.spicefactory.parsley.core.messaging.receiver.MessageReceiver;
    
    import views.StockList;

	public class AppContext
	{
        
        public var messageCreator:MessageCreator
        public var messageReciever:StockMessageReciever
        
        public var sl:StockList;
        public var stockCollection:ConfigurableArrayCollection;
        
        public var dictionary:Dictionary
        
		public function AppContext()
		{
            
                dictionary = new Dictionary(false);
            
                stockCollection = new ConfigurableArrayCollection([
                new Stock('DOW J', 12153.68, 12153.68 - 259.89),
                new Stock('NASDAQ', 2678.75, 2678.75 - 53.6),
                new Stock('S&P 500', 1263.85, 1263.85 - 24.16),
                new Stock('AAPL', 384.62, 384.62 + 0.60),
                new Stock('GOOG', 608.35, 608.35 - 13.27),
                new Stock('YHOO', 16.27, 16.27 - 0.32),
            ])
                    
                           
            sl = new StockList();
        
            refreshDictionary();
            
            goNuts();
            
            messageCreator = new MessageCreator();
            messageReciever = new StockMessageReciever();
		}
        
        public function refreshDictionary():void{
            dictionary = new Dictionary();
            for(var i:int=0; i<stockCollection.length; i++){
                var stock:Stock = stockCollection.getItemAt(i) as Stock;
                dictionary[stock.name] = stock;
            }
        }
        
        private function goNuts():void {
            for( var i:int = 0; i<100; i++){
                stockCollection.addItem(new Stock((Math.random()*100000).toString(32).toUpperCase(), Math.random()*10, Math.random() * 100 - 40));
            }
            
            refreshDictionary();
            //setTimeout(randomize, 50)
        }
        
        
	}
}