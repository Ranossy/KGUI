------------------------------------------------
-- �ļ���    :  ǧ��׺_�ͷ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-1-29
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǧ��׺_�ͷ�
-- ����Ч��  :  �ͷ�ǧ��׺BUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData=
{
	{nCostMana=125},
	{nCostMana=226},
	{nCostMana=314},
	{nCostMana=401},
	{nCostMana=488},
	{nCostMana=576}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    local bRetCode     = false;

    skill.BindBuff(1,1733,1)
    
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff--�����£����Ṧ
    ----------------- ����Cool down ---------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);
    --skill.SetNormalCoolDown(2, 193);
    
    --skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	
    ----------------- ����������� ----------------------------------------  
    --skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana

    --�����뾶��Ҳ���ǹ�������Ч����		
    --skill.nMaxRadius        = 10 * LENGTH_BASE;
    --skill.nAngleRange       = 256; 
    --����֡��
    --skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    --skill.nBulletVelocity   = 0;
    --����ϵĸ���
    --skill.nBreakRate        = 1000;
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