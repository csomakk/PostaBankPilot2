package Classes
{
    import config.StockMessage;

    public class MessageReciever
    {
        
        [Inject]
        public var stockCollection:ConfigurableArrayCollection;
        
        public function MessageReciever()
        {
        }
        
        [MessageHandler]
        public function handleLogin (message:StockMessage) : void {
            trace("handle")
        }
    }
}