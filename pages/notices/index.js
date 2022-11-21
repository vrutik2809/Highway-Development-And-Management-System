import { useCallback } from "react";

import Navbar from "../../components/Navbar";
import Footer from "../../components/Footer/Footer";
import { DataGrid, GridActionsCellItem } from '@mui/x-data-grid';
import DeleteIcon from '@mui/icons-material/Delete';
import SaveIcon from '@mui/icons-material/Save';
import { Box, Container } from "@material-ui/core";
import NoticeManipulationVisibility from "../../components/Privates/NoticeManipulationVisibility";

import { useState, useEffect } from "react";

import { makeStyles } from "@material-ui/core/styles";

import styles from "../../styles/jss/nextjs-material-kit/pages/noticesPage.js";

import axiosInstance from "../../utils/Axios";

const useStyles = makeStyles(styles);

export default (props) => {
    const classes = useStyles();
    const [notices, setNotices] = useState([]);
    const [isLoading, setIsLoading] = useState(true);
    useEffect(() => {
        const abortController = new AbortController();
        const getNotices = async () => {
            try {
                const promise = axiosInstance.get("/notices", { signal: abortController.signal });
                const { data } = await promise;
                console.log(data.data);
                setNotices(data.data);
                setIsLoading(false);
            } catch (error) {
                console.log(error);
                setIsLoading(false);
            }
        };
        getNotices();

        return () => {
            abortController.abort();
        }
    }, []);
    const sx = {
        width: '100%'
    }
    const columns = [
        { field: 'id', headerName: 'Notice ID', width: 70 },
        { field: 'description', headerName: 'Description', width: 500 ,editable: true},
        {
            field: 'actions',
            type: 'actions',
            width: 80,
            getActions: (params) => [
                <NoticeManipulationVisibility>
                    <GridActionsCellItem
                        icon={<DeleteIcon />}
                        label="Delete"
                        onClick={deleteNotice(params.id)}
                    />
                </NoticeManipulationVisibility>,
                <NoticeManipulationVisibility>
                    <GridActionsCellItem
                        icon={<SaveIcon />}
                        label="Update"
                        onClick={updateNotice(params)}
                    />
                </NoticeManipulationVisibility>,
            ]
        }
    ]
    const deleteNotice = useCallback((id) => async(event) =>{
        try {
            const promise = axiosInstance.delete(`/notices/${id}`);
            const { data } = await promise;
            console.log(data);
            setNotices(notices.filter(notice => notice.id !== id));
        } catch (error) {
            console.log(error);
            alert("Error in deleting notice");
        }
    }, [notices]);
    const updateNotice = useCallback((params) => async(event) =>{
        try {
            const {id,row} = params;
            const promise = axiosInstance.put(`/notices/${id}`,{description: row.description});
            const { data } = await promise;
            console.log(data);
            setNotices(notices.map(notice => notice.id === id ? {...notice,description: row.description} : notice));
        } catch (error) {
            console.log(error);
            alert("Error in updating notice");
        }
    }, [notices]);
    return (
        <>
            <Navbar />
            <Container className={classes.boxContainer}>
                <Box sx={sx}>
                    {notices && <DataGrid
                        rows={notices}
                        columns={columns}
                        pageSize={10}
                        loading={isLoading}
                        autoHeight={true}
                    />}
                </Box>
            </Container>
            <Footer />
        </>
    );
}