---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ӽ���_ˮ鿻�ӯ.lua
-- ����ʱ��:	2014/11/4 21:04:39
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�����¼�_֪����.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  ֪����
-- ����Ч��  :  ֪���ε��¼����ܣ�����ʱ�������Թ������ͷ�һ���˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 26},
	{nCostMana = 47},
	{nCostMana = 65},
	{nCostMana = 83},
	{nCostMana = 101},
	{nCostMana = 120}

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���ӽ���_ˮ鿻�ӯ.lua", -- ����ֵ1
		0											-- ����ֵ2
	);

	skill.BindBuff(1, 318, dwSkillLevel)

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);
	--skill.SetNormalCoolDown(1, 193);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER

	----------------- ���ü������� ---------------------------------------------------------------------
	--	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 253;	-- �������ĵ�����
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 15 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 256; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	-- skill.nBreakRate        = 128;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	--skill.nChannelFrame		= 80;
	--skill.nChannelInterval	= 16;

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

	if not player.GetBuff(8529, 1) then
		player.AddBuff(player.dwID, player.nLevel, 8528, 1)
		player.AddBuff(player.dwID, player.nLevel, 8529, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com