---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ǻ���_�����˺�5��.lua
-- ����ʱ��:	2013/11/26 11:17:56
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �Ӽ���_���ǽ���_5����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-07-08
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 144, nDamageRand = 8}, -- Level 1 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 152, nDamageRand = 16}, -- Level 2 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 230, nDamageRand = 23}, -- Level 3 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 308, nDamageRand = 31}, -- Level 4 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 386, nDamageRand = 39}, -- Level 5 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 464, nDamageRand = 47}, -- Level 6 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 542, nDamageRand = 55}, -- Level 7 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 620, nDamageRand = 62}, -- Level 8 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 698, nDamageRand = 70}, -- Level 9 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 776, nDamageRand = 78}, -- Level 10 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 854, nDamageRand = 86}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 932, nDamageRand = 94}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1010, nDamageRand = 101}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1088, nDamageRand = 109}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1166, nDamageRand = 117}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1244, nDamageRand = 125}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1322, nDamageRand = 133}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1400, nDamageRand = 140}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1478, nDamageRand = 148}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1556, nDamageRand = 156}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1634, nDamageRand = 164}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1712, nDamageRand = 172}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1790, nDamageRand = 179}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1868, nDamageRand = 187}, -- Level 24 
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1946, nDamageRand = 195}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2024, nDamageRand = 203}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2102, nDamageRand = 211}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2180, nDamageRand = 218}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2258, nDamageRand = 226}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2336, nDamageRand = 234}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2414, nDamageRand = 242}, -- Level 31
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2492, nDamageRand = 250}, -- Level 32
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2570, nDamageRand = 257}, -- Level 33
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2648, nDamageRand = 265}, -- Level 34
	{nAddRage = 0, nCostRage = 0, nDamageBase = 2726, nDamageRand = 273}, -- Level 35 
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 5;
    
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/���ǻ���_�����˺�5��.lua", -- ��Э��
		0
	);	 	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase * nSubsection / 100, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand * nSubsection / 100, -- ����ֵ1
		0																-- ����ֵ2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(														--2010.05.08��ӳ��似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1864,
		1
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(3472, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						--����CD 1.5��
	--skill.SetNormalCoolDown(1, 489);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
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
	--skill.nMinRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = (4 * nSubsection) * 0.85*1.1*1.1*1.05;
	elseif dwSkillLevel < 35 then
		skill.nChannelInterval = (4 * nSubsection + (dwSkillLevel - 9) * 0.65 * nSubsection) * 0.85*1.1*1.1*1.05; 
	else
		skill.nChannelInterval = 22.5 * nSubsection * 0.85*1.1*1.1*1.05;     -- ͨ�������ʱ�� 
	end
	--skill.nChannelFrame			= 0;	-- ͨ��������ʱ�䣬��λ֡�� 
	-- ������ͨ��ʱ����Ϊ����AP���ݾ���ʱ��������Ч��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local lv = player.GetSkillLevel(301)
	if player.GetSkillLevel(5830) == 1 and lv ~= 0 then
		target.AddBuff(player.dwID, player.nLevel, 5649, 1, 1)
		player.CastSkill(6095, lv)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com