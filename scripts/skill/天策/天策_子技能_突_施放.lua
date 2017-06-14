---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�Ӽ���_ͻ_ʩ��.lua
-- ����ʱ��:	2014/3/26 19:14:43
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_ͻ.lua
-- ������    :  ����
-- ����ʱ��  :  2008-03-04
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ͻ
-- ����Ч��  :  �ӿ��г���,��ɵ����˺�,������Ծ��ʹ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 34, nCostMana = 63, nDashSpeed = 120}, -- Level 1 Dash�ٶȵ�λ ��/֡
	{nDamage = 44, nCostMana = 83, nDashSpeed = 120}, -- Level 2
	{nDamage = 54, nCostMana = 103, nDashSpeed = 120}, -- Level 3
	{nDamage = 65, nCostMana = 122, nDashSpeed = 120}, -- Level 4
	{nDamage = 75, nCostMana = 142, nDashSpeed = 120}, -- Level 5
	{nDamage = 86, nCostMana = 162, nDashSpeed = 120}, -- Level 6
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(										--ͻ�������Ч��  2010.11.16 CBG
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
--		7,
--		9999
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�Ӽ���_ͻ_ʩ��.lua",
		0
	);

	--[[
	--����+�ӳٻ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3640,
		1
	);
	--]]
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
--		16,
--		0
--	);

--ʩ�� 70����Ѫ֧���µ� �� ��������ļ���50%
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC,
		519,
		1
	);--]]

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 98);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 8 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 25 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)

end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end
	--[[
	if player.GetSkillLevel(6511) ~= 1 then
		player.CastSkill(3640, 1)	--����Ч��
	else
		player.AddBuff(player.dwID,player.nLevel,207,1)
	end
	--]]
	--print(GetDistanceSq(player.nX, player.nY, player.nZ, target.nX, target.nY, target.nZ))
	if player.GetSkillLevel(14824) == 1 and GetDistanceSq(player.nX, player.nY, player.nZ, target.nX, target.nY, target.nZ) >= 20 * 64 * 20 * 64 then
		player.AddBuff(player.dwID, player.nLevel, 9867, 1)
	end
	
	player.CastSkill(3640, 1)	--����Ч��
	
	ModityCDToUI(player, 418, 0, 0)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com