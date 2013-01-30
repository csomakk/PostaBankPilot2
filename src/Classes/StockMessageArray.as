package Classes
{
    public class StockMessageArray
    {
        private var vector:Vector.<StockMessage> 
        public function StockMessageArray()
        {
            vector = new Vector.<StockMessage>();
        }
        
        public function pop():StockMessage{
            return vector.pop();
        }
        public function push(sm:StockMessage):uint{
            return vector.push(sm);
        }
        
        public function get length():uint{
            return vector.length;
        }
        
    }
}