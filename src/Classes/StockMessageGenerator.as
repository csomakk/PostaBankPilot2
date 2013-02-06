package Classes
{
    
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
            stockCollection.turnOffDispatcher();
            
            for( var i:int = 0; i < 50; i++ ) {
                var stop:int = Math.random()*10;
                var array:StockMessageArray = new StockMessageArray();
                for(var j:int = 0; j < stop; j++){
                    var stock:Stock = stockCollection.source[int(Math.random()*stockCollection.length)] as Stock;
                    var change:Number = (Math.random() - 0.5) * 0.01 * stock.yesterday;
                    array.push(
                        new StockMessage(
                            stock.name, 
                            stock.value + change, 
                            stock.yesterday
                        ));
                }
                dispatcher(array);
            }
            
            stockCollection.turnOnDispatcher();
            
            setTimeout(randomize, 50);
        }
    }
}