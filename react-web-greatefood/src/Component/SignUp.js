import React, { useState, useEffect, useRef } from 'react';
import { Container, Row, Col, Image, Card, Button, Spinner } from 'react-bootstrap';
import logo from '../images/logo2.gif';
import '../Css/SignUp.css';
import {
    useHistory,
    Link
} from "react-router-dom";
import * as FetchAPI from '../Utils/FetchAPI';
import { link } from '../Utils/Link';
import { getWindowDimensions } from '../Contain/getWindow';

export default function SignUp() {

    const [name, setName] = useState();
    const [username, setUsername] = useState();
    const [password, setPassword] = useState();
    const [repass, setRepass] = useState();
    const [address, setAddress] = useState();
    const [phone, setPhone] = useState();
    const [email, setEmail] = useState();
    var [loading, setLoading] = useState(false);
    const [showSpinner, setshowSpinner] = useState();
    const [messengeErorr, setmessengeErorr] = useState();
    const [codeShow, setcodeShow] = useState('');
    const [usernameTmp, setUsernameTmp] = useState();
    const [passwordTmp, setPasswordTmp] = useState();
    const [success, setSuccess] = useState(false);



    const handleSignUp = async () => {
        const data = {
            "HOTEN": name,
            "USERNAME": username,
            "PASSWORD": password,
            "EMAIL": email,
            "PHONE": phone,
            "ADDRESS": address
        }
        const res = await FetchAPI.postDataApi(link + "signup.php", data);
        console.log(res)
        if (res.result == "errUserName") {
            setmessengeErorr("Tên đăng nhập đã tồn tại, vui lòng chọn tên khác")
            setcodeShow('userNameExist')
        } else if (res.result == "errEmail") {
            setmessengeErorr("Email đã tồn tại, chọn email khác")
            setcodeShow('emailExist')
        } else if (res.result == "error") {
            console.log("Có lỗi đăng ký")
            setcodeShow('')
        } else {
            setcodeShow('')
            handleCleanInput()
            setSuccess(true)
        }
        setshowSpinner(false);
    }
    const handleCleanInput = () => {
        setUsernameTmp(username);
        setPasswordTmp(password);
        setName('');
        setUsername('');
        setPassword('');
        setRepass('');
        setAddress('');
        setEmail('');
        setPhone('');
    }

    useEffect(() => {
        // document.getElementsByClassName('footer')[0].style.display ='none'
    }, [])
    return (
        <div style={{ flex: 1 }}>
            {!loading ? (
                <div style={{ backgroundColor: '#dc3545', marginTop: 30, height: getWindowDimensions().height * 0.8, marginBottom: '5%' }}>
                    <Container>
                        <Row>
                            <Col className="justify-content-center hiddenlogo" lg={6} >
                                <Image src={logo} />
                            </Col>
                            <Col style={{ height: getWindowDimensions().height * 0.7 }} lg={6} md={12} >
                                <Card className="wrapperSignUp">
                                    <p style={{ fontSize: 20 }}>Đăng Ký</p>
                                    <form>
                                        <label>
                                            <input
                                                name="name"
                                                placeholder="Nhập đầy đủ họ tên"
                                                value={name} onChange={e => setName(e.target.value)}
                                            />
                                        </label>
                                        <label  >
                                            {/* <FloatingLabel
                                controlId="floatingInput"
                                label="Email address"
                                className="mb-3"
                            > */}
                                            <input
                                                name="username"
                                                type="text"
                                                style={{ marginTop: 10 }}
                                                placeholder="Nhập tên đăng nhập"
                                                value={username} onChange={e => setUsername(e.target.value)}
                                            />
                                            {/* </FloatingLabel> */}
                                        </label>
                                        <label >
                                            <input
                                                name="password"
                                                style={{ marginTop: 10 }}
                                                type="password"
                                                placeholder="Mật khẩu"
                                                value={password} onChange={e => setPassword(e.target.value)}
                                            />
                                        </label>
                                        <label>
                                            <input
                                                name="lock"
                                                style={{ marginTop: 10 }}
                                                type="password"
                                                onChangeText={(e) => setRepass(e)}
                                                placeholder="Nhập lại mật khẩu"
                                                value={repass} onChange={e => setRepass(e.target.value)}
                                            />
                                        </label>
                                        <label>
                                            <input
                                                name="address"
                                                style={{ marginTop: 10 }}
                                                placeholder="Nhập địa chỉ"
                                                value={address} onChange={e => setAddress(e.target.value)} />
                                        </label>
                                        <label>
                                            <input
                                                name="email"
                                                style={{ marginTop: 10 }}
                                                placeholder="Nhập Email"
                                                value={email} onChange={e => setEmail(e.target.value)}
                                            />
                                        </label>
                                        <label>
                                            <input
                                                name="phone"
                                                style={{ marginTop: 10 }}
                                                placeholder="Nhập Số điện thoại"
                                                value={phone} onChange={e => setPhone(e.target.value)}
                                            />
                                        </label>

                                        <Button className="btnSignUp" onClick={() => handleSignUp()}>ĐĂNG KÝ NGAY</Button>
                                        <div style={{ width: '90%', textAlign: 'center' }}>
                                            Bạn đã có tài khoản ? <Link to={'/login'}>Đăng nhập ngay</Link>
                                        </div>
                                    </form>
                                </Card>
                            </Col>
                        </Row>
                    </Container >
                </div>
            ) : (
                <Spinner style={{ position: 'absolute', bottom: '50%', left: '50%' }} animation="border" role="status" variant="danger" >
                    <span className="sr-only">Loading...</span>
                </Spinner>
            )}

        </div>
    )
}