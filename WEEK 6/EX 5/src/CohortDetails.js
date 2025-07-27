import styles from './CohortDetails.module.css';

const CohortDetails = ({ cohort }) => {
  const isOngoing = cohort.status.toLowerCase() === 'ongoing';
  const titleStyle = {
    color: isOngoing ? 'green' : 'blue',
    fontWeight: 'bold'
  };

  return (
    <div className={styles.card}>
      <h4 style={titleStyle}>{cohort.name}</h4>
      <dl>
        <dt>Started On</dt>
        <dd>{cohort.startDate}</dd>
        <dt>Current Status</dt>
        <dd>{cohort.status}</dd>
        <dt>Coach</dt>
        <dd>{cohort.coach}</dd>
        <dt>Trainer</dt>
        <dd>{cohort.trainer}</dd>
      </dl>
    </div>
  );
};

export default CohortDetails;
