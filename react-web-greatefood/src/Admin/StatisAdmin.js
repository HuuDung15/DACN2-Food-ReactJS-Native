import React, {useEffect,useState} from 'react';
import { Bar,Doughnut } from "react-chartjs-2";
import {Container,Row,Col,Card} from 'react-bootstrap';
import {getPriceVND} from '../Contain/getPriceVND';
import * as FetchAPI from '../Utils/FetchAPI';
import {link} from '../Utils/Link';

export default function StatisAdmin(){
    const [currentMonth,setCurrentMonth] = useState();
    const [currentYear,setCurrentYear] = useState();
    const [dataMonth,setDataMonth] = useState([0,0,0,0,0,0,0,0,0,0,0,0]);
    const [statusShown,setStatusShown] = useState(false);
    const [turnover,setTurnover] = useState('');
    const [turnoverMonth,setTurnoverMonth] = useState('');
    const [totalOrder,setTotalOrder] = useState('');
    const [totalOrder30Day,setTotalOrder30Day] = useState('');
    const [totalOrderToDay,setTotalOrderToDay] = useState('');
    const [statusOrderPayment,setStatusOrderPayment] = useState([0,0]);
    const [totalYearOrder,setTotalYearOrder] = useState('');


    function getCalendar(){
        let currentTime = new Date();
        setCurrentMonth(currentTime.getMonth());
        setCurrentYear(currentTime.getFullYear());
    }
    async function getBill(){
        try {
            const res = await FetchAPI.getDataApi(link+"getFullBill.php");
            let thistime = new Date();
            let turn = 0;
            let turnMonth = 0;
            let total = 0;
            let total30day = 0;
            let totalToday = 0;
            let totalYear = 0;
            for(var i=0;i<res.length;i++){
                if(res[i].status == 1){
                    let x = new Date(res[i].datedat);
                    let y = (thistime.getTime() - x.getTime())/(24*3600*1000);
                    total++;
                    statusOrderPayment[0]++;
                    for(var z=0;z<12;z++){
                    if(x.getMonth()==z&&x.getFullYear()==thistime.getFullYear()){
                        dataMonth[z]++;
                    }
                    }
                    if(Math.floor(y)<31){
                        total30day++;
                    } 
                    if(x.getFullYear()==thistime.getFullYear()){
                    turn+=parseInt(res[i].tongtien);
                    }
                    if(x.getMonth()==thistime.getMonth()){
                        turnMonth+=parseInt(res[i].tongtien);
                    }
                    if(x.getDate()==thistime.getDate()&&x.getMonth()==thistime.getMonth()&&x.getFullYear()==thistime.getFullYear()){
                        totalToday++;
                    }
                    if(x.getFullYear()==thistime.getFullYear()){
                        totalYear++;
                    }
                }
                else{
                    statusOrderPayment[1]++;
                }
            }
            setTurnover(turn);
            setTurnoverMonth(turnMonth);
            setTotalOrder(total);
            setTotalOrder30Day(total30day);
            setTotalOrderToDay(totalToday);
            setTotalYearOrder(totalYear);
        } catch (error) {
            
        }
       
    }
    useEffect(()=>{
        getCalendar();
        getBill();
        setTimeout(()=>{
            setStatusShown(true) 
        },300)
       
    },[])
    return(
        <div style={{ padding:30 }}>
            {/* dashboard */}
            <div className="dashboard">
            <Row>
                <Col xl={3}>
                <Card className="cardStatis carddd">
                    S??? ????n b??n ???????c trong h??m nay <br/>
                    <b>{totalOrderToDay}</b>
                </Card>
                </Col>
                <Col xl={3}>
                <Card className="cardStatis cardc">
                    S??? ????n b??n ???????c trong 30 ng??y <br/>
                   <b>{totalOrder30Day}</b>
                </Card>
                </Col>
                <Col xl={3} >
                <Card className="cardStatis carda">
                    T???ng ti???n b??n ???????c c???a n??m {currentYear}<br/>
                    <b> {getPriceVND(turnover)+"VN??"} </b>
                </Card>
                </Col>
                <Col xl={3}>
                <Card className="cardStatis cardb">
                    T???ng ti???n b??n ???????c c???a th??ng hi???n t???i (Th??ng {currentMonth+1}/{currentYear}) <br/>
                    <b>{getPriceVND(turnoverMonth)+"VN??"}</b>
                </Card>
                </Col>
            </Row>
            </div>

            {/* graph */}
            <Row>
            <Col xl={6}>
            <h4> Th???ng k?? s??? ????n h??ng b??n ???????c trong n??m {currentYear}</h4>
            <Container className="chart1" >
                {statusShown &&
                <Bar
                    data={{
                    labels: [
                        "Th??ng 1","Th??ng 2","Th??ng 3","Th??ng 4",
                        "Th??ng 5","Th??ng 6","Th??ng 7","Th??ng 8",
                        "Th??ng 9","Th??ng 10","Th??ng 11","Th??ng 12"
                    ],
                    datasets: [
                        {
                        label: "B???ng th???ng k??? ????n h??ng theo n??m .T???ng ( "+totalYearOrder+" ????n )",
                        backgroundColor: [
                            "#3e95cd",
                            "#8e5ea2",
                            "#3cba9f",
                            "#e8c3b9",
                            "#c45850"
                        ],
                        data: dataMonth
                        }
                    ]
                    }}
                    options={{
                    legend: { display: true },
                    title: {
                        display: true,
                        text: "S??? ????n h??ng trong n??m 2021",
                    }
                    }}
                />
                }
            </Container>
            </Col>
            <Col xl={6}>
            <h4> ????n h??ng thanh to??n</h4>
            <Container className="chart1">
            {statusShown &&
            <Doughnut 
                className="graphcircle"
                data={{
                labels: [
                    "????n ???? thanh to??n",
                    "????n ch??a thanh to??n",
                ],
                datasets: [
                    {
                    label: "Population (millions)",
                    backgroundColor: [
                        "#3e95cd",
                        "#8e5ea2",
                    ],
                    data: statusOrderPayment
                    }
                ]
                }}
                width={300}
	            height={300}
                option={{
                    responsive: true,
                    maintainAspectRatio: true,
                    title: {
                        display: true,
                        text: "Predicted world population (millions) in 2050",
                    }
                }}
            />
            }
            </Container>
            </Col>   
        </Row>
        
        </div>
    )
}