--������Ե������� ǧ������ һͳ����
--�书����
--������ѧ-��·
--����Ч����˵����������ѧ����·��
--���� 2007-03-22

--------------����ķָ���-----------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData ={
			{nLevelUpExp = 100},
			{nLevelUpExp = 200},
			{nLevelUpExp = 300},
			{nLevelUpExp = 400},
			{nLevelUpExp = 500},
			{nLevelUpExp = 600},
			{nLevelUpExp = 700},
			{nLevelUpExp = 800},
			{nLevelUpExp = 900},
			{nLevelUpExp = 0}
			}


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
    dwSkillLevel			=	skill.dwLevel;

    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, 2);
	
    ----------------- ����������� ----------------------------------------
   
    --��������
    skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    
		--skill.dwExpAdd					= 0;

    --�����뾶��Ҳ���ǹ�������Ч����
    skill.nMaxRadius        = 20 * LENGTH_BASE;
    skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 0;
    
    --��������
    skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;     
    
    skill.nBulletVelocity   = 24;	--�ӵ��ٶȣ���λ��/֡
    --����ϵĸ���
    skill.nBreakRate        = 1000;
   
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