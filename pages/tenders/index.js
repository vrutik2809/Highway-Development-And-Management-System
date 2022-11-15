import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import CircularProgress from "@material-ui/core/CircularProgress";
import { DataGrid } from '@mui/x-data-grid';
import { Box,Container} from "@material-ui/core";

import { useState, useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";

import styles from "../../styles/jss/nextjs-material-kit/pages/tendersPage.js";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const [tenders, setTenders] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    useEffect(() => {
        const abortController = new AbortController();
        const getTenders = async () => {
            const res = await fetch("/api/tenders", {
                signal: abortController.signal
            });
            const { data } = await res.json();
            setTenders(data);
            setIsLoading(false);
        };
        getTenders();
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
                    {tenders && <DataGrid
                        rows={tenders}
                        columns={[
                            { field: 'id', headerName: 'Tender ID', width: 80 },
                            { field: 'proposed_by', headerName: 'Proposed By Company', width: 200 },
                            { field: 'proposed_for', headerName: 'Proposed for Highway id', width: 200 },
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