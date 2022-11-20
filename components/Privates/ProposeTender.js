import { useRouter } from 'next/router'
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
        const router = useRouter();
        const { children } = props;
        const userID = sessionStorage.getItem('user_id');
        const userType = sessionStorage.getItem('user_type');
        if (!userID || !userType || userType !== 'company_auth') {
            router.push('/login');
        }
        return children;
    }
}