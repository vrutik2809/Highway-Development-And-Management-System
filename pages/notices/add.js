import GridContainer from "../../components/Grid/GridContainer.js";
import GridItem from "../../components/Grid/GridItem.js";
import Button from "../../components/CustomButtons/Button.js";
import Card from "../../components/Card/Card.js";
import CardBody from "../../components/Card/CardBody.js";
import CardHeader from "../../components/Card/CardHeader.js";
import CardFooter from "../../components/Card/CardFooter.js";
import CustomInput from "../../components/CustomInput/CustomInput.js";

import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import AddNotice from "../../components/Privates/AddNotice.js";

import { makeStyles } from "@material-ui/core/styles";
import styles from "../../styles/jss/nextjs-material-kit/pages/addNoticePage.js";

import { useForm } from 'react-hook-form'
import { useRouter } from 'next/router'
import { useEffect } from "react";

import axiosInstance from "../../utils/Axios";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const { register, handleSubmit, reset, formState} = useForm();
    const router = useRouter();
    const onSubmit = async (data) => {
        try {
            const promise = axiosInstance.post('/notices', data, {
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            const { data } = await promise;
        } catch (error) {
            console.log(error);
            alert('Error in adding notice');   
        }
    };
    useEffect(() => {
        if (formState.isSubmitSuccessful) {
            alert('Notice added successfully')
            reset({
                description: '',
            });
        }
    },[formState, reset]);
    return (
        <>
            <AddNotice>
                <Navbar />
                <GridContainer justify="center" className={classes.container}>
                    <GridItem xs={12} sm={12} md={4}>
                        <Card>
                            <form onSubmit={handleSubmit(onSubmit)}>
                                <CardHeader color="primary">
                                    <h4>Add Notice</h4>
                                </CardHeader>
                                <CardBody>
                                    <CustomInput
                                        labelText="Description"
                                        id="description"
                                        formControlProps={{
                                            fullWidth: true
                                        }}
                                        inputProps={{
                                            type: "textarea",
                                            ...register("description", { required: true })
                                        }}
                                    />
                                </CardBody>
                                <CardFooter>
                                    <Button simple color="primary" size="lg" type="submit">
                                        Enter
                                    </Button>
                                </CardFooter>
                            </form>
                        </Card>
                    </GridItem>
                </GridContainer>
                <Footer />
            </AddNotice>
        </>
    )
}