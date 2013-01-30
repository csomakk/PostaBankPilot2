package config
{
    import Classes.ConfigurableArrayCollection;
    import Classes.Stock;
    
    import flash.utils.Dictionary;
    import flash.utils.setTimeout;

    public class StockMessageGenerator
    {
        
        [MessageDispatcher]
        public var dispatcher:Function;
        
        [Inject]
        public var stockCollection:ConfigurableArrayCollection;
        
        public function StockMessageGenerator()
        {
            
        }
        
        [Init]
        public function randomize():void
        {
            stockCollection.turnOff();
            
            for( var i:int = 0; i < 50; i++) {
                var stop:int = Math.random()*10;
                var array:Array = new Array();
                for(var j:int = 0; j < stop; j++){
                    var stock:Stock = stockCollection.source[int(Math.random()*stockCollection.length)] as Stock;
                    var change:Number = (Math.random() - 0.5) * stock.yesterday * 0.1;
                    array.push(new StockMessage(stock.name, stock.value + change, stock.yesterday));
                }
                dispatcher(array);
            }
            
            stockCollection.turnOn();
            
            setTimeout(randomize, 50)
        }
    }
}