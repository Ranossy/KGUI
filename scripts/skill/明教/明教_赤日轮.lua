---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������.lua
-- ����ʱ��:	2015/2/4 14:32:39
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ֣����
-- ����ʱ��  :  20120613
-- ����Ч��  :  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 42 * 2 * 0.98, nLunarDamageRand = 42 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 77 * 2 * 0.98, nLunarDamageRand = 77 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 100 * 2 * 0.98, nLunarDamageRand = 100 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 123 * 2 * 0.98, nLunarDamageRand = 123 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 146 * 2 * 0.98, nLunarDamageRand = 146 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 169 * 2 * 0.98, nLunarDamageRand = 169 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 192 * 2 * 0.98, nLunarDamageRand = 192 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 215 * 2 * 0.98, nLunarDamageRand = 215 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 238 * 2 * 0.98, nLunarDamageRand = 238 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 262 * 2 * 0.98, nLunarDamageRand = 262 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 303 * 2 * 0.98, nLunarDamageRand = 303 * 2 * 0.04, nCostMana = 186},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, --��3��
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_������.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--��1��
		ATTRIBUTE_TYPE.CAST_SKILL,
		4028,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--��2��
		ATTRIBUTE_TYPE.CAST_SKILL,
		4029,
		dwSkillLevel
		);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 		--��3��
		ATTRIBUTE_TYPE.CAST_SKILL,
		4030,
		dwSkillLevel
		);
	--]]
	----------------- ����CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(503);		-- ���̹���CD 1��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 505);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--��������CD
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������

	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/10)*195;	-- �������ĵ�����
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0		 									--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�

	--skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
	skill.nChannelInterval = 80;

	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡

	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������

end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3286)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlev = player.GetSkillLevel(3962)
	if nlev == 0 then
		return
	end
	
	if player.GetSkillLevel(5988) == 1 then
		--����Ѩ\�ͷ�ѣ��Ŀ�����ι���
		player.CastSkill(13669, nlev, player.GetSkillTarget())
		player.CastSkill(13670, nlev, player.GetSkillTarget())
		player.CastSkill(13671, nlev, player.GetSkillTarget())
		--����Ѩ���ѣ��Ŀ��
		player.CastSkill(13672, nlev, player.GetSkillTarget())
		player.CastSkill(13673, nlev, player.GetSkillTarget())
		player.CastSkill(13674, nlev, player.GetSkillTarget())
	else
		--�ͷ�����Ѩ����ͨĿ�����ι���
		player.CastSkill(4028, nlev, player.GetSkillTarget())
		player.CastSkill(4029, nlev, player.GetSkillTarget())
		player.CastSkill(4030, nlev, player.GetSkillTarget())
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com