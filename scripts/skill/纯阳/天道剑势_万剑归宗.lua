---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/�������_�򽣹���.lua
-- ����ʱ��:	2013-6-7 0:48:39
-- �����û�:	xiedixun1
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �������_�򽣹���.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �������
-- ��������  :  �򽣹���
-- ����Ч��  :  ��������������裬������һ����Χ�ڵ�Ŀ������⹦�˺�..
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 67, nDamageRand = 7}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 10}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 138, nDamageRand = 14}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 174, nDamageRand = 17}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 209, nDamageRand = 21}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 245, nDamageRand = 24}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 280, nDamageRand = 28}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 316, nDamageRand = 31}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 351, nDamageRand = 35}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 387, nDamageRand = 38}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 422, nDamageRand = 42}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 458, nDamageRand = 46}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 493, nDamageRand = 49}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 529, nDamageRand = 53}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 564, nDamageRand = 56}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 600, nDamageRand = 60}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 635, nDamageRand = 63}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 671, nDamageRand = 67}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 706, nDamageRand = 70}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 742, nDamageRand = 74}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 777, nDamageRand = 78}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 813, nDamageRand = 81}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 848, nDamageRand = 85}, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 884, nDamageRand = 88}, -- Level 24 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 919, nDamageRand = 92}, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 955, nDamageRand = 95}, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 990, nDamageRand = 99}, -- Level 27 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1026, nDamageRand = 102}, -- Level 28 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1061, nDamageRand = 106}, -- Level 29 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1097, nDamageRand = 109}, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 1132, nDamageRand = 113}, -- Level 31	
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase/10,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/10,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
		);
	--û��Ѩ����Ŀ���ܿ�״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2298,
		dwSkillLevel
		);
	--]]
	--[[
	--����Ѩ������Ŀ���ܿ�״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14808,
		dwSkillLevel
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/�������_�򽣹���.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	--skill.BindBuff(1, 2291, 2)	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 83);	--����CD
	skill.SetCheckCoolDown(1, 444);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 494*0.1;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 494*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 494*0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 494*0.7;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 494;	-- �������ĵ�����
	end
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 24;
	elseif dwSkillLevel < 31 then
		skill.nChannelInterval = 24 + (dwSkillLevel - 9) * 3; 
	else
		skill.nChannelInterval = 100;
	end
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 50 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�
	skill.nAreaRadius = 6 * LENGTH_BASE;
	skill.nTargetCountLimit = 6;
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	--skill.nBreakRate        = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
       
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(311)

	if nlev ~= 0 then
		--[[
		if player.GetSkillLevel(14806) == 1 then
			player.CastSkill(14977, 1)	--�ж�����AOE����
	
			local nbuff_mark = player.GetBuff(9939, 1)
			if nbuff_mark and nbuff_mark.nStackNum == 1 then
				player.CastSkill(14976, nlev)	--���25%���˺�
			else
				player.CastSkill(14975, nlev)	--����AOE�˺�
			end
		else
			player.CastSkill(14975, nlev)	--����AOE�˺�
		end
		--]]
		player.CastSkill(14975, nlev)	--����AOE�˺�
	end
	--[[
	--������
	if player.GetSkillLevel(5804) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6087, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6087, 1, TARGET.NPC, dwCharacterID)
		end
	end
	--]]
	--[[
	--���͵�Ϣʱ��
	if player.GetSkillLevel(14806) == 1 then
		player.CastSkill(14807, 1)
	end
	--]]
end

function UnApply(dwCharacterID)
	--print("����, FOR TEST;(UnApply)")
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com