
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	skill.nMinRadius		= 0;										--����ʩ����С�뾶
	skill.nMaxRadius        = 25 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
	--skill.nAreaRadius       = 25 * LENGTH_BASE;
	skill.nPrepareFrames    = 160;										--����֡��,16֡����1�� 
	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
	--skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
end

function OnSkillLevelUp(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com