---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��ʷ֮��_����˻_��������.lua
-- ����ʱ��:	2013/5/29 19:50:03
-- �����û�:	zhengfeng4
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ǰ��.lua
-- ������    :  ����
-- ����ʱ��  :  2007-9-25
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǰ��
-- ����Ч��  :  ��ǰ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDashFrame = 16},
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		tSkillData[dwSkillLevel].nDashFrame,
		80
	);
	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 503);	--����1��GCD
	--skill.SetNormalCoolDown(2, 88);    
	--skill.SetNormalCoolDown(3, 165);
	
	----------------- ����������� ----------------------------------------  

	--�����뾶��Ҳ���ǹ�������Ч����
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64; 
	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 1000;
	--Ӳֱ
	--skill.nStiffFrames		= 16
   
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
	--if skill.dwLevel == 1 then
	--player.AcquireAchievement(671)
	--end
	--if skill.dwLevel == 2 then
	--player.AcquireAchievement(670)
	--end
	--if skill.dwLevel == 3 then
	--player.AcquireAchievement(669)
	--end
	--if skill.dwLevel == 4 then
	--player.AcquireAchievement(668)
	--end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com