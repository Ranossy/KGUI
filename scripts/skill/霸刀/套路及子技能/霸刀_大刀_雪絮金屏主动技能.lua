---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ե�/��·���Ӽ���/�Ե�_��_ѩ��������������.lua
-- ����ʱ��:	2016/9/20 10:41:25
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL, -- ħ������
		16845, -- ����ֵ1
		dwSkillLevel											-- ����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�Ե�/��·���Ӽ���/�Ե�_��_ѩ��������������.lua", -- ����ֵ1
		0											-- ����ֵ2
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת
	skill.AddSlowCheckSelfBuff(10816, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);	--�Ե��ʵ���̬Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 1136);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	--skill.nCostManaBasePercent = 0;							-- �������ĵ������ٷֱ�
	skill.nCostSunEnergy = 10;							-- �������ĵ�������
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- ����Ϊtrueʱ,��ʾȫ�����Ķ���
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	--------------------�������ò���----------------------------------------------
	--skill.nSkillBulletType = 1;					--�ӵ�����(����Ϊ1���Ե�Ϊ3)
	--skill.nSkillBulletSubType = 0;				--�ӵ���������,(��BulletTypeһ��ȷ����ͬ�ӵ��Ĳ�ͬ���֣�ȡֵ��Χ0~256)
	--skill.nAnimationPlayFrame = 0 				--�ӳ���ʧ֡�������Ϊ�����ӵ��󶯻��ȴ�ʱ��,�����ӵ���Ŀ�꿪ʼ����,��ô��֮֡��,����sbsEnd��Ϣ������.
	--skill.nMaxHitCount = 1						--���似�ܵ���󹥻�����
	--skill.nMaxHitRadius = 1 * 64					--�����ͷ��ߵ��������޶�
	--skill.nMaxHoodleRadius = 10 * LENGTH_BASE  	--������������
	--skill.nMaxSearchCount = 1 					--�Ƿ����Ƶ���Ŀ��(0Ϊ���� 1Ϊֻ��һ��Ŀ��)
	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
	--skill.bInstantChannel = false;				-- ͨ�������Ƿ��������һ���˺�
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local nTime = 4
	if player.GetSkillLevel(17047) == 1 then
		nTime = nTime + 2
	end
	
	local npc_qiqiang = scene.CreateNpcWithEmployerID(53803, player.nX, player.nY, player.nZ, player.nFaceDirection, 16 * nTime, player.dwID, false, player.dwIdentityVisiableID)
	if npc_qiqiang then
		player.SetTimer(2, "scripts/skill/�Ե�/��·���Ӽ���/�Ե�_��_ѩ��������������.lua", npc_qiqiang.dwID, nTime)
		npc_qiqiang.SetRelationProxyID(player.dwID)
		--[[
		--��ǽ����ѣ��
		if player.GetSkillLevel(16911) == 1 then
			npc_qiqiang.AddBuff(player.dwID, player.nLevel, 11450, 1)
			local nbuff = npc_qiqiang.GetBuff(11450, 1)
			if nbuff then
				nbuff.nCustomValue = 1
			end
		end
		
		--����Npc�����������޵�
		npc_qiqiang.AddBuff(player.dwID, player.nLevel, 11250, 1)
		--]]
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end

	local npc_qiqiang = GetNpc(nParam1)
	if not npc_qiqiang then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	if player.GetSkillLevel(17047) == 1 then
		--6�����
		player.PlaySfx(1536, npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nZ, npc_qiqiang.nFaceDirection * 360 / 256)
	else
		--4�����
		player.PlaySfx(1523, npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nZ, npc_qiqiang.nFaceDirection * 360 / 256)
	end
	local Dst_X, Dst_Y = GetDestinationPoint(npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nFaceDirection, 20 * 64)
	if player.GetSkillLevel(16957) == 1 then
		local QQ_List = player.GetAdvancedDynamicObstacleList(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8)
		if #QQ_List ~= 0 then
			for i = 1, #QQ_List do
				--print("i"..i)
				--print(QQ_List[i].dwIndex)
				--print(QQ_List[i].dwPlayerID)
				if IsEnemy(player.dwID, QQ_List[i].dwPlayerID) then
					local target = GetPlayer(QQ_List[i].dwPlayerID)
					if target then
						for j = 1, 4 do
							local nbuff_index = target.GetBuff(11469 + j, 1)
							if nbuff_index and nbuff_index.nCustomValue == QQ_List[i].dwIndex then
								local nbuff_mark = target.GetBuff(11465 + j, 1)
								if nbuff_mark then
									local npc_mark = GetNpc(nbuff_mark.nCustomValue)
									if npc_mark then
										npc_mark.SetDisappearFrames(1, 0)
									end
								end
								target.DelBuff(11469 + j, 1)
								target.DelBuff(11465 + j, 1)
								break
							end
						end
					end
					player.RemoveAdvancedDynamicObstacle(player.nX, player.nY, QQ_List[i].dwIndex)
				end
			end
		end
	else
		local nIndex = 0
		if player.GetSkillLevel(17047) == 1 then
			nIndex = player.AddAdvancedDynamicObstacle(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8, 96, ADVANCED_DYNAMIC_OBSTACLE_TYPE.ONLY_ENEMY)
		else
			nIndex = player.AddAdvancedDynamicObstacle(npc_qiqiang.nX, npc_qiqiang.nY, Dst_X, Dst_Y, npc_qiqiang.nZ - 2 * 64 * 8, npc_qiqiang.nZ + 8 * 64 * 8, 64, ADVANCED_DYNAMIC_OBSTACLE_TYPE.ONLY_ENEMY)
		end

		if player.GetSkillLevel(16911) == 1 then
			local Mid_X, Mid_Y = GetDestinationPoint(npc_qiqiang.nX, npc_qiqiang.nY, npc_qiqiang.nFaceDirection, 10 * 64)
			local nFaceDir = 0
			if npc_qiqiang.nFaceDirection + 64 >= 256 then
				nFaceDir = npc_qiqiang.nFaceDirection + 64 - 256
			else
				nFaceDir = npc_qiqiang.nFaceDirection + 64
			end
			local npc_mid = scene.CreateNpcWithEmployerID(53803, Mid_X, Mid_Y, npc_qiqiang.nZ, nFaceDir, 16 * nParam2, player.dwID, false, player.dwIdentityVisiableID)
			if npc_mid then
				npc_mid.SetRelationProxyID(player.dwID)
				npc_mid.AddBuff(player.dwID, player.nLevel, 4339, 1, 20)
				
				--��ǽ����ѣ��
				npc_mid.AddBuff(player.dwID, player.nLevel, 11450, 1)
				local nbuff = npc_mid.GetBuff(11450, 1)
				if nbuff then
					nbuff.nCustomValue = 1
				end

				--����Npc�����������޵�
				npc_mid.AddBuff(player.dwID, player.nLevel, 11250, 1)

				for i = 1, 4 do
					if not player.GetBuff(11465 + i, 1) then
						player.AddBuff(player.dwID, player.nLevel, 11465 + i, 1, 4)
						local nbuff_mark = player.GetBuff(11465 + i, 1)
						if nbuff_mark then
							nbuff_mark.nCustomValue = npc_mid.dwID
						end
						
						player.AddBuff(player.dwID, player.nLevel, 11469 + i, 1, 4)
						local nbuff_index = player.GetBuff(11469 + i, 1)
						if nbuff_index then
							nbuff_index.nCustomValue = nIndex
						end
		
						break
					end
				end
			end
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com