------------------------------------------------
-- �ļ���    :  ݶ����_����_ը��_��Χ����_�˺�.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2009-3-11
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����һ��debuff ��ʧcall�ű� ָ����������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--tSkillData =
--{
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 1		0-4
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 2		5-9
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 3		10-14
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 4		15-19
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 5		20-24
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 6		25-29
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 7		30-34
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 8		35-39
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 9		40-44
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 10		45-49
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 11		50-54
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 12		55-59
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 13		60-64
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 14		65-69
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 15		70-74
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 16		75-79
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 17		80-84
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 18		85-89
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 19		90-94
--	{nDamageBase = 0, nDamageRand = 0, nCostMana = 38,	nBuffID = 975,	nBuffLevel = 1},		--level 20		95-99
--	
--	
--};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		20000, 
		0
	);

--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,						-- ��������ģʽ
--   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
--   		nAttributeValue1,							--����ֵ1
--   		nAttributeValue2							--����ֵ2
--   		);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(nType, dwBuffID, nStackNum)		-- ��������Buff
    --skill.AddSlowCheckDestBuff(nType, dwBuffID, nStackNum)		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	

-- ����Buff
	--skill.BindDebuff(nDebuffID, nBuffLevel);		-- ����Debuff
	--skill.BindDot(nDotID, nDotLevel);				-- ����Dot
	--skill.BindHot(nHotID, nHotLevel);				-- ����Hot 

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
    --skill.nCostRage		= 0;					-- �������ĵ�ŭ��
    --skill.nCostStamina	= 0;					-- �������ĵ�����
    --skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 5 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
    skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
    ----------------- Ŀ��Ѫ����� ---------------------------------------------
    --skill.nTargetLifePercentMax    =  100; --Ŀ��Ѫ�������ޣ�0-100
    --skill.nTargetLifePercentMin    =  0  ; --Ŀ��Ѫ��������
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com