--������Ե������� ǧ������ һͳ����
--�书����
--���߼���-CDר��
--����Ч����˵���������߼���CDר��
--���� 2007-6-12

--------------����ķָ���-----------------------------------------------------
tSkillData = 
{
    {nCoolDownTime = 35},
    {nCoolDownTime = 2},  --�����ڹ�����
    {nCoolDownTime = 3},
    {nCoolDownTime = 4},
    {nCoolDownTime = 5},
    {nCoolDownTime = 3},
    {nCoolDownTime = 4},
    {nCoolDownTime = 5}
};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	
	----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    skill.SetNormalCoolDown(3, tSkillData[dwSkillLevel].nCoolDownTime);
	
    ----------------- ����������� ----------------------------------------
   
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