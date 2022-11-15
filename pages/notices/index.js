import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import CircularProgress from "@material-ui/core/CircularProgress";
import { DataGrid } from '@mui/x-data-grid';
import { Box,Container} from "@material-ui/core";

import { useState, useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";

import styles from "../../styles/jss/nextjs-material-kit/pages/noticesPage.js";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const [notices, setNotices] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    useEffect(() => {
        const abortController = new AbortController();
        const getNotices = async () => {
            const res = await fetch("/api/notices", {
                signal: abortController.signal
            });
            const { data } = await res.json();
            setNotices(data);
            setIsLoading(false);
        };
        getNotices();
        return () => {
            console.log('fetch aborted');
            abortController.abort();
        }
    }, []);
    const sx = {
        height: 550, 
        width: '100%' 
    }
    return (
        <>
            <Navbar />
            <Container className={classes.boxContainer}>
                <Box sx={sx}>
                    {isLoading && <CircularProgress />}
                    {notices && <DataGrid
                        rows={notices}
                        columns={[
                            { field: 'id', headerName: 'Notice ID', width: 70 },
                            { field: 'description', headerName: 'Description', width: 300 },
                        ]}
                        pageSize={10}
                    />}
                </Box>
            </Container>
            <Footer />
        </>
    );
}