---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/�����Ǳ�/���_��ͨ����.lua
-- ����ʱ��:	2016/9/22 15:52:12
-- �����û�:	zhengfeng5
-- �ű�˵��:  ֻ��npc�����˺���3�ߡ�
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	----------------- ����������� ----------------------------------------

	--�����뾶��Ҳ���ǹ�������Ч����
	skill.nMaxRadius = 30.0 * LENGTH_BASE;
	skill.nAngleRange = 128;

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com