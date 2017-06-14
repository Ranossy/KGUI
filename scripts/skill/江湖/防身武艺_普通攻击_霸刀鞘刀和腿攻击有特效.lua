---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��������_��ͨ����_�Ե���������Ч.lua
-- ����ʱ��:	2016/8/10 16:31:56
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��������_��ͨ����.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-9-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ��ͨ����
-- ����Ч��  :  ��ͨ��������Ŀ����������˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	skill.AddSlowCheckSelfBuff(11079, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); ---����Ч
	skill.AddSlowCheckSelfBuff(10814, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --û��˫��
    skill.AddSlowCheckSelfBuff(10815, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --û�д�
	--skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 590);

	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;
	skill.nAngleRange = 96;
	--����֡��
	--skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	--skill.nBulletVelocity = 0;
	--����ϵĸ���
	  skill.nBreakRate = 1000;
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--if player.GetKungfuMount().dwSkillID == 10268 then
	--return false
	--end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com