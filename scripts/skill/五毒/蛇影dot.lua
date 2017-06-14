------------------------------------------------
-- ������   :  ����	
-- ����ʱ��	:  2007-12-11
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 111/3*0.95, 	nDamageRand = 111/3*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 126/3*0.95, 	nDamageRand = 126/3*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 141/3*0.95, 	nDamageRand = 141/3*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 156/3*0.95, 	nDamageRand = 156/3*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 171/3*0.95, 	nDamageRand = 171/3*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 186/3*0.95, 	nDamageRand = 186/3*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 201/3*0.95, 	nDamageRand = 201/3*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 216/3*0.95, 	nDamageRand = 216/3*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 231/3*0.95, 	nDamageRand = 231/3*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 246/3*0.95, 	nDamageRand = 246/3*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 261/3*0.95, 	nDamageRand = 261/3*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 276/3*0.95, 	nDamageRand = 276/3*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 291/3*0.95, 	nDamageRand = 291/3*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 306/3*0.95, 	nDamageRand = 306/3*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 321/3*0.95, 	nDamageRand = 321/3*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 336/3*0.95, 	nDamageRand = 336/3*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 351/3*0.95, 	nDamageRand = 351/3*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 366/3*0.95, 	nDamageRand = 366/3*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 381/3*0.95, 	nDamageRand = 381/3*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 396/3*0.95, 	nDamageRand = 396/3*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 411/3*0.95, 	nDamageRand = 411/3*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 426/3*0.95, 	nDamageRand = 426/3*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 441/3*0.95, 	nDamageRand = 441/3*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 456/3*0.95, 	nDamageRand = 456/3*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 471/3*0.95, 	nDamageRand = 471/3*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 486/3*0.95, 	nDamageRand = 486/3*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 501/3*0.95, 	nDamageRand = 501/3*0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 516/3*0.95, 	nDamageRand = 516/3*0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 531/3*0.95, 	nDamageRand = 531/3*0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 546/3*0.95, 	nDamageRand = 546/3*0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 561/3*0.95, 	nDamageRand = 561/3*0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 576/3*0.95, 	nDamageRand = 576/3*0.1, }, -- Level 32
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff   

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�
	
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 2296, dwSkillLevel);	
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 54;
 	elseif dwSkillLevel < 32 then
  		skill.nChannelInterval = 54 + (dwSkillLevel - 9) * 9
  	else
  		skill.nChannelInterval =286;     -- ͨ�������ʱ��   
 	end
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com