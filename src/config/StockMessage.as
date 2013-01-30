package config
{
    public class StockMessage
    {
        public var name:String;
        public var yesterday:Number;
        public var latest:Number;
        
        public function StockMessage(name:String, latest:Number, yesterday:Number)
        {
            this.name = name;
            this.yesterday = yesterday;
            this.latest = latest;
        }
    }
}