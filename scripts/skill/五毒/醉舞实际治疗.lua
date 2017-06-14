---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/����ʵ������.lua
-- ����ʱ��:	2013/5/11 14:34:06
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 78*0.95, 	nDamageRand = 78*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 92*0.95, 	nDamageRand = 92*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 106*0.95, 	nDamageRand = 106*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120*0.95, 	nDamageRand = 120*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 134*0.95, 	nDamageRand = 134*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 148*0.95, 	nDamageRand = 148*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 162*0.95, 	nDamageRand = 162*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 176*0.95, 	nDamageRand = 176*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190*0.95, 	nDamageRand = 190*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 204*0.95, 	nDamageRand = 204*0.1, }, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 218*0.95, 	nDamageRand = 218*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 232*0.95, 	nDamageRand = 232*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 246*0.95, 	nDamageRand = 246*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 260*0.95, 	nDamageRand = 260*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 274*0.95, 	nDamageRand = 274*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 288*0.95, 	nDamageRand = 288*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 302*0.95, 	nDamageRand = 302*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 316*0.95, 	nDamageRand = 316*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 330*0.95, 	nDamageRand = 330*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 344*0.95, 	nDamageRand = 344*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 358*0.95, 	nDamageRand = 358*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 372*0.95, 	nDamageRand = 372*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 386*0.95, 	nDamageRand = 386*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 400*0.95, 	nDamageRand = 400*0.1, }, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 414*0.95, 	nDamageRand = 414*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 428*0.95, 	nDamageRand = 428*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 442*0.95, 	nDamageRand = 442*0.1, }, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 456*0.95, 	nDamageRand = 456*0.1, }, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 470*0.95, 	nDamageRand = 470*0.1, }, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 484*0.95, 	nDamageRand = 484*0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 498*0.95, 	nDamageRand = 498*0.1, }, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 512*0.95, 	nDamageRand = 512*0.1, }, -- Level 32
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nDamageBase/10,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nDamageRand/10,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
	);
    
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	skill.nChannelInterval = 26; 				-- ͨ�������ʱ��
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