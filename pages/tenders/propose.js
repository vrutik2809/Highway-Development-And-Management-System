import GridContainer from "../../components/Grid/GridContainer.js";
import GridItem from "../../components/Grid/GridItem.js";
import Button from "../../components/CustomButtons/Button.js";
import Card from "../../components/Card/Card.js";
import CardBody from "../../components/Card/CardBody.js";
import CardHeader from "../../components/Card/CardHeader.js";
import CardFooter from "../../components/Card/CardFooter.js";
import CustomInput from "../../components/CustomInput/CustomInput.js";
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';

import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import ProposeTender from "../../components/Privates/ProposeTender.js";

import { makeStyles } from "@material-ui/core/styles";
import styles from "../../styles/jss/nextjs-material-kit/pages/proposeTenderPage.js";

import { useForm } from 'react-hook-form'
import { useState,useEffect } from "react";

import axiosInstance from "../../utils/Axios";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const [highways, setHighways] = useState([]);
    const { register, handleSubmit, reset, formState ,getValues} = useForm();
    const onSubmit = async (body) => {
        try {
            body.proposed_by_company_id = Number(sessionStorage.getItem('user_id'));
            console.log(body);
            const promise = axiosInstance.post('/tenders', body, {
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            const { data } = await promise;
            console.log(data.data);
        } catch (error) {
            console.log(error);
            alert('Error in proposing tender');
        }
    };
    useEffect(() => {
        const abortController = new AbortController();
        const getHighways = async () => {
            try {
                const promise = axiosInstance.get("/highways", { signal: abortController.signal });
                const { data } = await promise;
                console.log(data.data);
                setHighways(data.data);
            } catch (error) {
                console.log(error);
            }
        };
        getHighways();
        return () => {
            abortController.abort();
        }
    }, []);
    useEffect(() => {
        if (formState.isSubmitSuccessful) {
            alert('Tender proposed successfully!');
            reset({
                title: '',
                description: '',
                proposed_for_highway_id: '',
            });
        }
    }, [formState, reset]);
    return (
        <>
            <ProposeTender>
                <Navbar />
                <GridContainer justify="center" className={classes.container}>
                    <GridItem xs={12} sm={12} md={4}>
                        <Card>
                            <form onSubmit={handleSubmit(onSubmit)}>
                                <CardHeader color="primary">
                                    <h4>Propose Tender</h4>
                                </CardHeader>
                                <CardBody>
                                    <FormControl fullWidth>
                                        <InputLabel id="proposed_for_highway_id">Highway ID</InputLabel>
                                        <Select
                                            labelId="proposed_for_highway_id"
                                            id="proposed_for_highway_id"
                                            value={getValues('proposed_for_highway_id')}
                                            label="Highway ID"
                                            inputProps={{
                                                ...register('proposed_for_highway_id', { required: true })
                                            }}
                                        >
                                            {highways && highways.map((highway) => (
                                                <MenuItem key={highway.id} value={highway.id}>{highway.id}</MenuItem>
                                            ))}
                                        </Select>
                                    </FormControl>
                                </CardBody>
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
            </ProposeTender>
        </>
    )
}