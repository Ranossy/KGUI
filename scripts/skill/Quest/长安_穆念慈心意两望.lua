------------------------------------------------
-- �ļ���    : ����_�������������.lua
-- ������    :  �²���	
-- ����ʱ��  :  2009-2-10
-- ��;(ģ��):  �书����
-- �书����  :  NPC
-- �书����  :  DeBuff
-- �书��·  :  ��������
-- ��������  :  ��������
-- ����Ч��  :  Ŀ��ѣ��3�롣
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------


Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nBuffID = 505, nBuffLevel = 1, nCostMana = 0},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
 
 

----------------- ����CoolDown ---------------------------------------------------------------------
    --CoolDownλ(��4��)��SetCoolDown(posi, id)��posiΪCoolDownλ��idΪCoolDown��id��Ҫ��CoolDownList.tab
    --skill.SetCoolDown(1, 1);	--����CD
   


	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 0;

    --skill.nMinRadius		= 0			--����ʩ����С�뾶
    --skill.nMaxRadius        = 25 * LENGTH_BASE;	--����ʩ�����뾶
    --skill.nAngleRange       = 256; 			--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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