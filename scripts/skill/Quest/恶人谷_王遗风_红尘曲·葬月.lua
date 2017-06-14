------------------------------------------------
-- �ļ���    :  ���˹�_���ŷ�_�쳾��������.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-8-14
-- ��;(ģ��):  BOSS
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ����Ч��  :  ��Χ�ڵ����ܵ�DOT�����ɽ����ÿ3����2000������13�롣
----------------------�͵��ķָ���--------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =                                                                          
{                                                                                     
	{nDamageBase = 724   *0.8, nDamageRand = 724   *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 1228  *0.8, nDamageRand = 1228  *0.4, nCostMana = 0},		--level 2		  
	{nDamageBase = 1761  *0.8, nDamageRand = 1761  *0.4, nCostMana = 0},		--level 3		  
	{nDamageBase = 2562  *0.8, nDamageRand = 2562  *0.4, nCostMana = 0},		--level 4		  
	{nDamageBase = 3363  *0.8, nDamageRand = 3363  *0.4, nCostMana = 0},		--level 5		  
	{nDamageBase = 4627  *0.8, nDamageRand = 4627  *0.4, nCostMana = 0},		--level 6		  
	{nDamageBase = 5517  *0.8, nDamageRand = 5517  *0.4, nCostMana = 0},		--level 7		  
	{nDamageBase = 6407  *0.8, nDamageRand = 6407  *0.4, nCostMana = 0},		--level 8		  
	{nDamageBase = 7297  *0.8, nDamageRand = 7297  *0.4, nCostMana = 0},		--level 9		  
	{nDamageBase = 15542  *0.8, nDamageRand = 15542  *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 9077  *0.8, nDamageRand = 9077  *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 9968  *0.8, nDamageRand = 9968  *0.4, nCostMana = 0},		--level 12		
	{nDamageBase = 10858 *0.8, nDamageRand = 10858 *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 11748 *0.8, nDamageRand = 11748 *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 12638 *0.8, nDamageRand = 12638 *0.4, nCostMana = 0},		--level 15	  
	{nDamageBase = 13528 *0.8, nDamageRand = 13528 *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 14418 *0.8, nDamageRand = 14418 *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 15308 *0.8, nDamageRand = 15308 *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 16198 *0.8, nDamageRand = 16198 *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 17088 *0.8, nDamageRand = 17088 *0.4, nCostMana = 0},		--level 20		
};                                                                                    

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
		local dwSkillLevel	= skill.dwLevel
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
  	--skill.AddSlowCheckSelfBuff(1159, 1,BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);			-- ��������Buff
   
	----------------- BUFF��� -------------------------------------------------
  	skill.BindBuff(1, 1374, 1);								-- ����1��λBuff
		--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
		--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
		--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
		--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
		--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
		--skill.nCostLife		= 0;										-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;								-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 4* LENGTH_BASE;			-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 256;								-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 30 * LENGTH_BASE;		-- �������ð뾶 
 		skill.nTargetCountLimit	= 20;						-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 48;			-- ����֡��
    --skill.nChannelInterval	= 48; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 145;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- Ŀ��Ѫ������ ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
   	skill.nBeatBackRate      = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate					= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
		--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
		--skill.nWeaponDamagePercent		= 0;		-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com