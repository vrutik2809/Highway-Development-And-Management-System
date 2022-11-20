import { useState, useEffect } from 'react';

export default (props) => {
    const [showChild, setShowChild] = useState(false);
    useEffect(() => {
        setShowChild(true);
    }, []);

    if (!showChild) {
        return null;
    }

    if (typeof window === 'undefined') {
        return <></>;
    }
    else {
        const { children } = props;
        const userID = sessionStorage.getItem('user_id');
        const userType = sessionStorage.getItem('user_type');
        if (!userID || !userType || userType !== 'company_auth') {
            return <div />;
        }
        return children;
    }
}