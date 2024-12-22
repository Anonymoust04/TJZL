import { namespaceWrapper } from '@_koii/namespace-wrapper';

interface Donation {
  donorAddress: string;
  amount: number;
  projectId: string;
  timestamp: number;
}

export async function processDonation(donation: Donation): Promise<void> {
  try {
    // Verify donation amount
    const currentTotal = await namespaceWrapper.storeGet(`project_${donation.projectId}_total`) || 0;
    const newTotal = currentTotal + donation.amount;
    
    // Store updated project total
    await namespaceWrapper.storeSet(`project_${donation.projectId}_total`, newTotal);
    
    // Check if donor qualifies for dividend rewards (25% or more)
    const projectTarget = await namespaceWrapper.storeGet(`project_${donation.projectId}_target`);
    const donationPercentage = (donation.amount / projectTarget) * 100;
    
    if (donationPercentage >= 25) {
      await namespaceWrapper.storeSet(`dividend_recipient_${donation.donorAddress}`, true);
    }
    
    // Emit donation event
    console.log(`Donation processed: ${donation.amount} to project ${donation.projectId}`);
  } catch (error) {
    console.error('Process donation error:', error);
  }
} 