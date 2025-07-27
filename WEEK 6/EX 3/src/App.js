import './Stylesheets/mystyle.css'
import { CalculateScore } from './Components/CalculateScore';
function App() {
  return (
    <div>
     <CalculateScore Name={"Steeve"}
     School={"DNV public school"}
     total={282}
     goal={3}/>
    </div>
  );
}

export default App;
