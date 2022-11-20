import React from "react";
// @material-ui/core components
import { makeStyles } from "@material-ui/core/styles";
import InputAdornment from "@material-ui/core/InputAdornment";
import Icon from "@material-ui/core/Icon";
// @material-ui/icons
import People from "@material-ui/icons/People";
// core components
import GridContainer from "/components/Grid/GridContainer.js";
import GridItem from "/components/Grid/GridItem.js";
import Button from "/components/CustomButtons/Button.js";
import Card from "/components/Card/Card.js";
import CardBody from "/components/Card/CardBody.js";
import CardHeader from "/components/Card/CardHeader.js";
import CardFooter from "/components/Card/CardFooter.js";
import CustomInput from "/components/CustomInput/CustomInput.js";

import Navbar from "/components/Navbar";
import Footer from "/components/Footer/Footer";

import styles from "/styles/jss/nextjs-material-kit/pages/loginPage.js";

import { useForm } from 'react-hook-form'
import { useRouter } from 'next/router'

import axiosInstance from "../utils/Axios";


const useStyles = makeStyles(styles);

export default (props) => {
  const [cardAnimaton, setCardAnimation] = React.useState("cardHidden");
  setTimeout(function () {
    setCardAnimation("");
  }, 700);
  const classes = useStyles();
  const { ...rest } = props;
  const router = useRouter();
  const { register, handleSubmit, watch, formState: { errors } } = useForm();
  const onSubmit = async (body) => {
    try {
      console.log(body);
      const promise = axiosInstance.post('/auth/login',body,{
        headers: {
          'Content-Type': 'application/json'
        }
      });
      const { data } = await promise;
      sessionStorage.setItem('user_id', data.data.id);
      sessionStorage.setItem('user_type', data.data.type);
      router.push('/');
    } catch (error) {
      console.log(error);
      alert("Error logging in please try again");
    }
  };
  return (
    <div>
      <Navbar />
      <div
        className={classes.pageHeader}
        style={{
          backgroundImage: "url('/img/bg7.jpg')",
          backgroundSize: "cover",
          backgroundPosition: "top center"
        }}
      >
        <div className={classes.container}>
          <GridContainer justify="center">
            <GridItem xs={12} sm={6} md={4}>
              <Card className={classes[cardAnimaton]}>
                <form className={classes.form} onSubmit={handleSubmit(onSubmit)}>
                  <CardHeader color="primary" className={classes.cardHeader}>
                    <h4>Login</h4>
                  </CardHeader>
                  <CardBody>
                    <CustomInput
                      labelText="User Name"
                      id="username"
                      formControlProps={{
                        fullWidth: true
                      }}
                      inputProps={{
                        type: "text",
                        endAdornment: (
                          <InputAdornment position="end">
                            <People className={classes.inputIconsColor} />
                          </InputAdornment>
                        ),
                        ...register("username", { required: true })
                      }}
                    />
                    <CustomInput
                      labelText="Password"
                      id="pass"
                      formControlProps={{
                        fullWidth: true
                      }}
                      inputProps={{
                        type: "password",
                        endAdornment: (
                          <InputAdornment position="end">
                            <Icon className={classes.inputIconsColor}>
                              lock_outline
                            </Icon>
                          </InputAdornment>
                        ),
                        autoComplete: "off",
                        ...register("password", { required: true })
                      }}
                    />
                  </CardBody>
                  <CardFooter className={classes.cardFooter}>
                    <Button simple color="primary" size="lg" type="submit">
                      Enter
                    </Button>
                  </CardFooter>
                </form>
              </Card>
            </GridItem>
          </GridContainer>
        </div>
        <Footer />
      </div>
    </div>
  );
}
