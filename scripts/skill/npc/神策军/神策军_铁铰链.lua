------------------------------------------------
-- �ļ���    :  ��߾�_������.lua
-- ������    :  �²���	
-- ����ʱ��  :  2008-8-27
-- ��;(ģ��):  �书����
-- �书����  :  ��߾�
-- �书����  :  Dot
-- ��������  :  ������
-- ����Ч��  :  ʹĿ��ÿ3���ܵ�Y���⹦�˺�������15��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
         {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 1 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 2 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 3 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 4 },
         {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 5 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 6 },
         {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 7 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 8 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 9 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 10 },
         {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 11 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 12 },
         {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 13 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 14 },
	 {nCostMana = 0, nBreakRate = 0, nBuffID = 667, nBuffLevel = 15 },
};


--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����DeBuff---------	
skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     --skill.SetNormalCoolDown(1,7);
	
--������������-------
  
    --��������
   skill.nCostMana         = tSkillData[dwSkillLevel].nCostMana;
    --�����뾶��Ҳ���ǹ�������Ч����
   skill.nMinRadius		= 0 * LENGTH_BASE;
      skill.nMaxRadius        = 4 * LENGTH_BASE;
    -- ������Χ�����νǶȷ�Χ 
  skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    --skill.nBulletVelocity   = tSkillData[dwSkillLevel].nBulletVelocity;
    --����ϵĸ���
    skill.nBreakRate        = 0;
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com