------------------------------------------------
-- �ļ���    :  ��ħ��ն��_ǰ��.lua
-- ������    :  ֩��
-- ����ʱ��  :  2009-9-09
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ���Լ���
-- ��������  :  ��ħ��ն�� ǰ��
-- ����Ч��  :  ��������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nDashSpeed = 120},
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
    
	--һ��ʱ����ͷ��Ӽ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		1418,
		1
	);
    
    skill.BindBuff(1,1402,1)  --������������Buff
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
	
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(2, 88);    
    --skill.SetNormalCoolDown(3, 165);
	
    ----------------- ����������� ----------------------------------------  

    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMinRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������
	skill.nAngleRange       = 85; 										--ʩ�ŽǶ�,ȫ��256
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    skill.nBulletVelocity   = 0;
    --����ϵĸ���
    skill.nBreakRate        = 1000;
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
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com