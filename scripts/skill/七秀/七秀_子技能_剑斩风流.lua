---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_�Ӽ���_��ն����.lua
-- ����ʱ��:	2015/6/16 20:57:58
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�Ӽ���_��ն����.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �ڹ�
-- �书��·  :  Գ������
-- ��������  :  ��ն����
-- ����Ч��  :  ǿ����նɱ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 120 * 0.98, nDamageRand = 94 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 125 * 0.98, nDamageRand = 102 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 130 * 0.98, nDamageRand = 110 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 135 * 0.98, nDamageRand = 118 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 140 * 0.98, nDamageRand = 126 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 145 * 0.98, nDamageRand = 134 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 150 * 0.98, nDamageRand = 142 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 155 * 0.98, nDamageRand = 150 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 160 * 0.98, nDamageRand = 158 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 166 * 0.98, nDamageRand = 166 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 174 * 0.98, nDamageRand = 174 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 182 * 0.98, nDamageRand = 182 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 190 * 0.98, nDamageRand = 190 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 198 * 0.98, nDamageRand = 198 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 206 * 0.98, nDamageRand = 206 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 214 * 0.98, nDamageRand = 214 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 222 * 0.98, nDamageRand = 222 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 230 * 0.98, nDamageRand = 230 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_�Ӽ���_��ն����.lua",
		0
	);
	--skill.BindBuff(1, 2838, 2);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 436);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	--skill.nWeaponDamagePercent	= 2048;
	skill.nMinRadius = 0 * LENGTH_BASE;											--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶
	--skill.nPrepareFrames    = 24;										--����֡��,16֡����1��
	skill.nBulletVelocity = 0;
	skill.nChannelInterval = 112 * 1.1*1.1;										--�ӵ��ٶ�,��/֡
	--skill.nBreakRate	= 1024;									--���ʩ������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
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

	local lv = player.GetSkillLevel(2707)
	if player.GetSkillLevel(5868) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6207, lv,TARGET.PLAYER,dwCharacterID)
			player.CastSkill(9346, lv, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6207, lv,TARGET.NPC,dwCharacterID)
			player.CastSkill(9346, lv, TARGET.NPC, dwCharacterID)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com