---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�Ӽ���_�����޽�_10����.lua
-- ����ʱ��:	2013/11/26 11:18:39
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �Ӽ���_������_10����.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2008-07-07
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �Ӽ���
-- ��������  :  ��
-- ����Ч��  :  ��������-�����޽����Ӽ��ܣ�����������˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 254, nDamageRand = 15}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 328, nDamageRand = 24}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 402, nDamageRand = 32}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 476, nDamageRand = 40}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 550, nDamageRand = 48}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 624, nDamageRand = 56}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 698, nDamageRand = 65}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 772, nDamageRand = 73}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 846, nDamageRand = 81}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 920, nDamageRand = 89}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 994, nDamageRand = 97}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1068, nDamageRand = 106}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1142, nDamageRand = 114}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1216, nDamageRand = 122}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1290, nDamageRand = 130}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1364, nDamageRand = 138}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase  = 1438, nDamageRand = 147}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1512, nDamageRand = 155}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1586, nDamageRand = 163}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1660, nDamageRand = 171}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1734, nDamageRand = 179}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1808, nDamageRand = 188}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1882, nDamageRand = 196}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1956, nDamageRand = 204}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2030, nDamageRand = 212}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2104, nDamageRand = 220}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2178, nDamageRand = 229}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2252, nDamageRand = 237}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2326, nDamageRand = 245}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2400, nDamageRand = 253}, -- Level 31 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2474, nDamageRand = 261}, -- Level 32 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2548, nDamageRand = 270}, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2622, nDamageRand = 278}, -- Level 34
	{nAddRage = 0, nCostRage = 10, nDamageBase = 2696, nDamageRand = 286}, -- Level 35
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
	local nSubsection = 10;
    
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�Ӽ���_�����޽�_10����.lua", -- ��Э��
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/90����Ѩ/�����ظ�5����.lua", -- ��Э��
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase * nSubsection / 10/12, -- ����ֵ1
		0															-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand * nSubsection / 10/12, -- ����ֵ1
		0															-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0													-- ����ֵ2
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		-5, -- ����3��
		0
	);
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_�߾�����.lua", -- ��Э��
		0
	);	
    
	skill.AddAttribute(														--2010.05.08��ӳ��似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1863,
		1
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
	--skill.SetPublicCoolDown(16);						--����CD 1.5��
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= MELEE_ATTACK_DISTANCE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 4 * nSubsection*1.1*1.1;
	elseif dwSkillLevel < 35 then
		skill.nChannelInterval = (4 * nSubsection + (dwSkillLevel - 9) * 0.5 * nSubsection)*1.1*1.1; 
	else
		skill.nChannelInterval = 19 * nSubsection*1.1*1.1;     -- ͨ�������ʱ�� 
	end
	--skill.nChannelFrame			= 0;	-- ͨ��������ʱ�䣬��λ֡�� 
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 2048;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
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
	--player.CastSkill(711, 5)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local lv = player.GetSkillLevel(365)
	if player.GetSkillLevel(5800) == 1 and lv ~= 0 then
		target.AddBuff(player.dwID, player.nLevel, 5649, 1, 1)
		player.CastSkillXYZ(6085, lv, target.nX, target.nY, target.nZ)
		player.PlaySfx(480, target.nX, target.nY, target.nZ + 500)
	end
	---ɾ�����ƶ������޽��ļӳ�
	if player.GetBuff(11815, 1)then
		player.DelBuff(11815,1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com