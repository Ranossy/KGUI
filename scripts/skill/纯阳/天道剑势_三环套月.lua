------------------------------------------------
-- �ļ���    :  �������_��������.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-07-01
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  ��������
-- ����Ч��  :  �����˺�������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 40, 	nDamageRand = 17}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, 	nDamageRand = 21}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 114, 	nDamageRand = 25}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151, 	nDamageRand = 28}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 189, 	nDamageRand = 32}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 226, 	nDamageRand = 36}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 263, 	nDamageRand = 40}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 301, 	nDamageRand = 43}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 338, 	nDamageRand = 47}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 375, 	nDamageRand = 51}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 413, 	nDamageRand = 54}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 450, 	nDamageRand = 58}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 487, 	nDamageRand = 62}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 524, 	nDamageRand = 66}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 562, 	nDamageRand = 69}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 599, 	nDamageRand = 73}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 636, 	nDamageRand = 77}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 674, 	nDamageRand = 81}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 711, 	nDamageRand = 84}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 748, 	nDamageRand = 88}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 786, 	nDamageRand = 92}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 823, 	nDamageRand = 95}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 860, 	nDamageRand = 99}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 897, 	nDamageRand = 103}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 935, 	nDamageRand = 107}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 972, 	nDamageRand = 110}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1009, 	nDamageRand = 114}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1047, 	nDamageRand = 118}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1084, 	nDamageRand = 122}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1121, 	nDamageRand = 125}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1159, 	nDamageRand = 129}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1196, 	nDamageRand = 133}, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1233, 	nDamageRand = 137}, -- Level 33 	
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,							-- ħ������
		tSkillData[dwSkillLevel].nDamageBase/10,							-- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,						-- ħ������
		tSkillData[dwSkillLevel].nDamageRand/10,							-- ����ֵ1
		0																--����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,				-- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,								-- ħ������
		0,																-- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,				-- ��������ģʽ
		ATTRIBUTE_TYPE.ACCUMULATE,										-- ħ������
		2,																-- ����ֵ1
		0																-- ����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);		-- ����CD
	skill.SetNormalCoolDown(1, 173);		-- 2.5��
	skill.SetCheckCoolDown(1, 444);
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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 119*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 119 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 119*0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 119*0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 119;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= MELEE_ATTACK_DISTANCE;-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 16*1.1;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 9) * 4)*1.1
	else
		skill.nChannelInterval =120*1.1;     -- ͨ�������ʱ��   
	end
	--skill.nChannelFrame		= 32;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13252)
	local nQuestPhase = player.GetQuestPhase(13252)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com