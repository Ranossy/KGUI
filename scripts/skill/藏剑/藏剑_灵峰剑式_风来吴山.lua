---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_������ɽ.lua
-- ����ʱ��:	2014/7/9 20:20:01
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_��彣ʽ_������ɽ.lua
-- ������    :  zhangqi
-- ����ʱ��  :  2010-03-2
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ��彣ʽ
-- ��������  :  ������ɽ
-- ����Ч��  :  ������ɽ����ɽ���磬��ľ�Է�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 50, nDamageBase = 108, nDamageRand = 3}, -- Level 1
	{nAddRage = 0, nCostRage = 50, nDamageBase = 124, nDamageRand = 4}, -- Level 2
	{nAddRage = 0, nCostRage = 50, nDamageBase = 140, nDamageRand = 5}, -- Level 3
	{nAddRage = 0, nCostRage = 50, nDamageBase = 156, nDamageRand = 5}, -- Level 4
	{nAddRage = 0, nCostRage = 50, nDamageBase = 172, nDamageRand = 6}, -- Level 5
	{nAddRage = 0, nCostRage = 50, nDamageBase = 188, nDamageRand = 7}, -- Level 6
	{nAddRage = 0, nCostRage = 50, nDamageBase = 204, nDamageRand = 8}, -- Level 7
	{nAddRage = 0, nCostRage = 50, nDamageBase = 220, nDamageRand = 9}, -- Level 8
	{nAddRage = 0, nCostRage = 50, nDamageBase = 236, nDamageRand = 9}, -- Level 9
	{nAddRage = 0, nCostRage = 50, nDamageBase = 252, nDamageRand = 10}, -- Level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--������ɽ�˺�û��Ѩ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1905,
		dwSkillLevel
		);
	--������ɽ����Ѩվ���˺�1.3
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14618,
		dwSkillLevel
		);
	--������ɽ�˺�����Ѩ��վ��״̬����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14619,
		dwSkillLevel
		);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1801,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1908,
		1
	);  --2010.05.20��Ӵ�ϼ��ܶ������Ӽ���

	skill.AddAttribute(														--70����
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3084,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_��彣ʽ_������ɽ.lua",
		0
	);
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 1950, 1);		-- ����1��λBuff �����������HOT
	--skill.BindBuff(2, 1856, 1);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff
	skill.AddSlowCheckSelfBuff(1694, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 343);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostRage = tSkillData[dwSkillLevel].nCostRage;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChannelInterval = 10; 				-- ͨ�������ʱ��
	--skill.nChannelInterval = 10; 				-- ͨ�������ʱ��
	skill.nChannelFrame = 84;	 			-- ͨ��������ʱ�䣬��λ֡��
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 6 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nWeaponDamagePercent	= 2048;
	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	skill.nMinChannelFrame = 1
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 1950, 1) --������Ծ
		--local xiaori = player.GetBuff(1903,1)
		--local Level = player.GetSkillLevel(10145)
		--if xiaori == nil and Level >= 7 then
		player.AddBuff(0, 99, 1856, 1)	--���
		--end
		for i = 1, 7 do
			if player.GetBuff(10103, 1) then
				player.DelGroupBuff(10103, 1)
			end

			if player.GetBuff(10104, 1) then
				player.DelGroupBuff(10104, 1)
			end
		end
		return nPreResult
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1362)
	end
end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetSkillLevel(9292)== 1 then 
		player.AddBuff(player.dwID,player.nLevel,7976,1)
	end
	--]]

	ModityCDToUI(player, 1645, 0, 0)
end




 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com