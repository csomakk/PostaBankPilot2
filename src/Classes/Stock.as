package Classes 
{
    public class Stock
    {
        [Bindable]
        public var name:String;
        [Bindable]
        public var value:Number;
        [Bindable]
        public var yesterday:Number;
        
        public function Stock(name:String, value:Number, dailyChange:Number)
        {
            this.name = name;
            this.value = value;
            this.yesterday = dailyChange;
        }
        
    }
}